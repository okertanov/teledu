//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public class MessagingPayload: NSObject {
    public private(set) var timestamp: UInt64
    public private(set) var publisher: String
    public private(set) var payload: [AnyHashable: Any]
    
    public init(_ timestamp: UInt64, _ publisher: String, _ payload: [AnyHashable: Any]) {
        self.timestamp = timestamp
        self.publisher = publisher
        self.payload = payload
    }
}
