//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

@objc public protocol MessagingService: Service {
    func subscribe(_ channel: String, _ block: @escaping (AnyObject) -> Void)
    func unsubscribe(_ channel: String)
    func fetchHistory(_ channel: String, _ block: @escaping (AnyObject) -> Void)
}

public enum MessagingSubscriptionStatus {
    case connected, disconnected, error
}

public class MessagingPayload {
    public private(set) var timestamp: UInt64
    public private(set) var publisher: String
    public private(set) var payload: [AnyHashable: Any]
    
    public init(_ timestamp: UInt64, _ publisher: String, _ payload: [AnyHashable: Any]) {
        self.timestamp = timestamp
        self.publisher = publisher
        self.payload = payload
    }
}

public enum MessagingError: Error {
    case subscriptionError(message: String)
    case historyError(message: String)
}
