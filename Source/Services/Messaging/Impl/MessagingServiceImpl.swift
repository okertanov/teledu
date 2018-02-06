//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import PubNub

//
// MessagingServiceImpl class - implements PubNub protocol
// See https://www.pubnub.com/docs/swift/pubnub-swift-sdk
//
class MessagingServiceImpl: BaseService, MessagingService {
    private enum PubNubKeys: String {
        case publishKey = "pub-c-8a217905-fba2-49fb-8172-6d098d2c064c"
        case subscribeKey = "sub-c-954f25ae-f22a-11e7-acf8-26f7716e5467"
    }
    
    private var client: PubNub?
    private var eventListener: PubNubEventListener?
    fileprivate var incomeMessageHandler: ((AnyObject) -> Void)?
    fileprivate var incomeHistoryHandler: ((AnyObject) -> Void)?
    
    required init() {
        super.init()
        
        let configuration = PNConfiguration(publishKey: PubNubKeys.publishKey.rawValue, subscribeKey: PubNubKeys.subscribeKey.rawValue)
        configuration.stripMobilePayload = false
        self.client = PubNub.clientWithConfiguration(configuration)
        
        self.eventListener = PubNubEventListener(self)
        self.client!.addListener(self.eventListener!)
    }
    
    func subscribe(_ channel: String, _ block: @escaping (AnyObject) -> Void) {
        incomeMessageHandler = block
        self.client!.subscribeToChannels([channel], withPresence: false)
    }
    
    func unsubscribe(_ channel: String) {
        self.client!.unsubscribeFromChannels([channel], withPresence: false)
    }
    
    func fetchHistory(_ channel: String, _ block: @escaping (AnyObject) -> Void) {
        incomeHistoryHandler = block
        
        self.client!.historyForChannel(channel, withCompletion: { (result, status) in
            if status == nil {
                /**
                 Handle downloaded history using:
                 result.data.start - oldest message time stamp in response
                 result.data.end - newest message time stamp in response
                 result.data.messages - list of messages
                 */
                let payloads = result!.data.messages.flatMap { (message: Any?) -> MessagingPayload? in
                    // TODO: 'message' is a Collection of the Dictionaries
                    if let data = message as? PNMessageData {
                        return MessagingPayload(data.timetoken, data.publisher, data.message)
                    }
                    return nil
                }
                self.incomeHistoryHandler?(payloads as AnyObject)
            }
            else {
                /**
                 Handle message history download error. Check 'category' property
                 to find out possible reason because of which request did fail.
                 Review 'errorData' property (which has PNErrorData data type) of status
                 object to get additional information about issue.
                 Request can be resent using: status.retry()
                 */
                let err = MessagingError.historyError(message: status!.stringifiedCategory())
                self.incomeHistoryHandler?(err as AnyObject)
            }
        })
    }
}

fileprivate class PubNubEventListener: NSObject, PNObjectEventListener {
    private weak var parentRef: MessagingServiceImpl?
    
    required init(_ parent: MessagingServiceImpl) {
        parentRef = parent
    }
    
    func client(_ client: PubNub, didReceiveMessage message: PNMessageResult) {
        let payload = MessagingPayload(message.data.timetoken, message.data.publisher, message.data.message)
        parentRef?.incomeMessageHandler?(payload as AnyObject)
    }
    
    func client(_ client: PubNub, didReceive status: PNStatus) {
        if status.isError {
            let err = MessagingError.subscriptionError(message: status.stringifiedCategory())
            parentRef?.incomeMessageHandler?(err as AnyObject)
        }
        else {
            parentRef?.incomeMessageHandler?(MessagingSubscriptionStatus.from(status) as AnyObject)
        }
    }
    
    func client(_ client: PubNub, didReceivePresenceEvent event: PNPresenceEventResult) {
        parentRef?.incomeMessageHandler?(event.data.presenceEvent as AnyObject)
    }
}

fileprivate extension MessagingSubscriptionStatus {
    static func from(_ status: PNStatus) -> MessagingSubscriptionStatus {
        if status.isError {
            return .error
        }
        switch status.category {
        case .PNConnectedCategory:
            return .connected
        case .PNDisconnectedCategory:
            return .disconnected
        default:
            return .error
        }
    }
}

fileprivate extension MessagingPayload {
    convenience init(_ timetoken: NSNumber, _ publisher: String, _ payload: Any?) {
        self.init(UInt64(timetoken.int64Value), publisher, payload as? [AnyHashable: Any] ?? [:])
    }
}
