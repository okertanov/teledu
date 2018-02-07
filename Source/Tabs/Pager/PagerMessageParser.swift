//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class PagerMessageParser: GenericMessagingMessageParser<PagerMessage> {    
    required init() {
    }
    
    override func canParse(_ payload: MessagingPayload) -> Bool {
        let text = payload.payload["text"] as? String
        let description = payload.payload["description"] as? String
        let parsable = !(text.isNullOrEmpty && description.isNullOrEmpty)
        return parsable
    }
    
    override func parse(_ payload: MessagingPayload) -> Message {
        let message = PagerMessage(
            identifier: NSUUID().uuidString,
            text: payload.payload["text"] as? String,
            description: payload.payload["description"] as? String,
            foregroundColor: payload.payload["foregroundColor"] as? String,
            backgroundColor: payload.payload["backgroundColor"] as? String,
            imageUrl: payload.payload["imageUrl"] as? String
        )
        
        return message
    }
}
