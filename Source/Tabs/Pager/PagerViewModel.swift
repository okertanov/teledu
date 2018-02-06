//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class PagerViewModel: ViewModel {
    private enum Channels : String {
        case pager = "teledu-pager"
    }
    
    private lazy var messagingService: MessagingService? = serviceContext?.resolve(MessagingService.self)
    
    public let propertyChanged = Event<String>()
    
    public private(set) var message: PagerMessage = PagerMessage.empty {
        didSet { propertyChanged.raise("message") }
    }
    
    public private(set) var history: [PagerMessage] = [] {
        didSet { propertyChanged.raise("history") }
    }
    
    public required init() {
        super.init()
    }
    
    func subscribe() {
        message = PagerMessage.empty
        messagingService!.subscribe(Channels.pager.rawValue)
    }
    
    func unsubscribe() {
        message = PagerMessage.empty
        messagingService!.unsubscribe(Channels.pager.rawValue)
    }
    
    fileprivate func onMessage(message: PagerMessage) {
        self.message = message
    }
    
    fileprivate func onHistory(messages: [PagerMessage]) {
        self.history.append(contentsOf: messages)
    }
}
