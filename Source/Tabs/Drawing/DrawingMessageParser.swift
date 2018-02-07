//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class DrawingMessageParser: Activable, Registrable, MessagingMessageParser {
    typealias Message = DrawingMessage
    
    required init() {
    }
    
    func canParse(_ payload: MessagingPayload) -> Bool {
        return false
    }
    
    func parse(_ payload: MessagingPayload) -> Message {
        return DrawingMessage.empty
    }
}
