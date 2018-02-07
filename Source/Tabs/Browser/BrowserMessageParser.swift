//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class BrowserMessageParser: GenericMessagingMessageParser<BrowserMessage> {
    required init() {
    }
    
    override func canParse(_ payload: MessagingPayload) -> Bool {
        return false
    }
    
    override func parse(_ payload: MessagingPayload) -> Message {
        return BrowserMessage.empty
    }
}
