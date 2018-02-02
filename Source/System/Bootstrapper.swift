//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class Bootstrapper {
    private let serviceContext = ApplicationServiceContext()
    
    func initialize() {
        initializeImpl()
    }
    
    func initializeUi() -> UIWindow? {
        return initializeUiImpl()
    }
    
    func register(_ completion: CommonTypes.VoidBlockType?) {
        registerImpl()
        completion?()
    }
    
    func terminate(_ completion: CommonTypes.VoidBlockType?) {
        terminateImpl()
        completion?()
    }
    
    fileprivate func initializeImpl() {
    }
    
    fileprivate func initializeUiImpl() -> UIWindow? {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return UIWindow(frame: UIScreen.main.bounds)
        }
        return keyWindow
    }
    
    fileprivate func registerImpl() {
        serviceContext.register(MessageBoxService.self, MessageBoxServiceImpl())
        serviceContext.register(WebSocketService.self, WebSocketServiceImpl())
        serviceContext.register(MessagingService.self, MessagingServiceImpl())
    }
    
    fileprivate func terminateImpl() {
    }
}
