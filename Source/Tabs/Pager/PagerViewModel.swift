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
    
    public required init() {
        super.init()
    }
    
    func subscribe() {
        messagingService?.subscribe(Channels.pager.rawValue)
    }
    
    func unsubscribe() {
        messagingService?.unsubscribe(Channels.pager.rawValue)
    }
}
