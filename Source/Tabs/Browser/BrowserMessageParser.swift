//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class BrowserMessageParser: Activable, Registrable, MessagingMessageParser {
    typealias Message = BrowserMessage
    
    required init() {
    }
    
    func canParse(_ payload: MessagingPayload) -> Bool {
        return false
    }
    
    func parse(_ payload: MessagingPayload) -> Message {
        return BrowserMessage.empty
    }
}
