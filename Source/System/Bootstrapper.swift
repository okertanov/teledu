//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit
import Common

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
            let window = UIWindow(frame: UIScreen.main.bounds)
            let rootVc = ViewLocator.locateVC(RootTabBarController.self, RootTabBarViewModel.self)
            window.rootViewController = rootVc
            window.makeKeyAndVisible()
            return window
        }
        return keyWindow
    }
    
    fileprivate func registerImpl() {
        ServiceLocator.setContext(serviceContext)
        
        // TODO: Check conformance A <- B
        serviceContext.register(MessageBoxService.self, Activator.activate(MessageBoxServiceImpl.self))
        serviceContext.register(WebSocketService.self, Activator.activate(WebSocketServiceImpl.self))
        serviceContext.register(MessagingService.self, Activator.activate(MessagingServiceImpl.self))
        
        serviceContext.registerMany(AbstractMessagingMessageParser.self, [
            Activator.activate(PagerMessageParser.self) as Registrable,
            Activator.activate(DrawingMessageParser.self)  as Registrable,
            Activator.activate(BrowserMessageParser.self)  as Registrable
        ])
    }
    
    fileprivate func terminateImpl() {
    }
}
