//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

@objc protocol AbstractMessagingMessageParser: Registrable {
    func canParse(_ payload: MessagingPayload) -> Bool
}

protocol AssociatedMessagingMessageParser: AbstractMessagingMessageParser {
    associatedtype Message
    
    func parse(_ payload: MessagingPayload) -> Message
}
