//
//  Created by Oleg Kertanov on 07/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class GenericMessagingMessageParser<T: Activable>: AssociatedMessagingMessageParser, Activable {
    typealias Message = T
    
    required init() {
    }
    
    func canParse(_ payload: MessagingPayload) -> Bool {
        return false
    }
    
    func parse(_ payload: MessagingPayload) -> Message {
        return T()
    }
}
