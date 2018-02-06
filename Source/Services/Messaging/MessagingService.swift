//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

@objc public protocol MessagingService: Service {
    func subscribe(_ channel: String, _ block: @escaping (AnyObject) -> Void)
    func unsubscribe(_ channel: String)
    func fetchHistory(_ channel: String, _ block: @escaping (AnyObject) -> Void)
}
