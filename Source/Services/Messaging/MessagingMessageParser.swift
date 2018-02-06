//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

protocol MessagingMessageParser: class {
    associatedtype Message
    
    func canParse(_ payload: MessagingPayload) -> Bool
    func parse(_ payload: MessagingPayload) -> Message
}
