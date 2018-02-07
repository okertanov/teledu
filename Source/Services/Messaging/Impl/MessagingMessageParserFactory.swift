//
//  Created by Oleg Kertanov on 07/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class MessagingMessageParserFactory: BaseService {
    private lazy var messageParsers: [AbstractMessagingMessageParser]? = serviceContext?.resolveAll(AbstractMessagingMessageParser.self)
    
    public func getMessageParser<T: AssociatedMessagingMessageParser>(_ payload: MessagingPayload) -> T? {
        let parser = messageParsers?
            .filter { $0.canParse(payload) }
            .first
        return parser as? T
    }
}
