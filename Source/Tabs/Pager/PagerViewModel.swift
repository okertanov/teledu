//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class PagerViewModel: ViewModel {
    private lazy var messagingService: MessagingService? = serviceContext?.resolve(MessagingService.self)
    
    public required init() {
        super.init()
    }
    
    func subscribe(to channel: String) {
        messagingService?.subscribe(channel)
    }
    
    func unsubscribe(from channel: String) {
        messagingService?.unsubscribe(channel)
    }
}
