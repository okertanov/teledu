//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class PagerViewModel: ViewModel, ViewModelRequired {
    private enum Channels : String {
        case pager = "teledu-pager"
    }
    
    private lazy var messagingService: MessagingService? = serviceContext?.resolve(MessagingService.self)
    
    public var title: String {
        return "Pager"
    }
    
    public let propertyChanged = Event<AnyKeyPath>()
    
    public private(set) var connected: Bool = false {
        didSet { propertyChanged.raise(\PagerViewModel.connected) }
    }
    
    public private(set) var message: PagerMessage = PagerMessage.empty {
        didSet { propertyChanged.raise(\PagerViewModel.message) }
    }
    
    public private(set) var history: [PagerMessage] = [] {
        didSet { propertyChanged.raise(\PagerViewModel.history) }
    }
    
    public required init() {
        super.init()
    }
    
    public func subscribe() {
        message = PagerMessage.empty
        messagingService!.subscribe(Channels.pager.rawValue, dispatchSubscribeResult)
    }
    
    public func unsubscribe() {
        message = PagerMessage.empty
        messagingService!.unsubscribe(Channels.pager.rawValue)
    }
    
    public func fetchHistory() {
        messagingService!.fetchHistory(Channels.pager.rawValue, dispatchHistoryResult)
    }
    
    fileprivate func dispatchHistoryResult(_ result: AnyObject) {
        if let result = result as? AnySequence<MessagingPayload> {
            result.forEach { print($0) }
        }
    }
    
    fileprivate func dispatchSubscribeResult(_ result: AnyObject) {
        switch result {
        case is MessagingSubscriptionStatus:
            onMessagingStatus(result as! MessagingSubscriptionStatus)
        case is MessagingPayload:
            onMessagingPayload(result as! MessagingPayload)
        case is Error:
            onSubscribeStatusError(result as! Error)
        case is String:
            onStringMessage(result as! String)
        default:
            onUnknownMessage(result)
        }
    }
    
    fileprivate func onMessagingStatus(_ status: MessagingSubscriptionStatus) {
        self.connected = status == .connected
    }
    
    fileprivate func onMessagingPayload(_ payload: MessagingPayload) {
        //self.message = message
    }
    
    fileprivate func onMessagingHistory(_ payloads: [MessagingPayload]) {
        //self.history.append(contentsOf: payloads)
    }
    
    fileprivate func onSubscribeStatusError(_ error: Error) {
        print("Error: ", error)
    }
    
    fileprivate func onStringMessage(_ message: String) {
        print("String: ", message)
    }
    
    fileprivate func onUnknownMessage(_ message: AnyObject) {
        print("Unknown: ", message)
    }
}
