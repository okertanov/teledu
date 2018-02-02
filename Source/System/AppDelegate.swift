//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import UIKit
import TVMLKit
import Common

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    let bootstrapper = Bootstrapper()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        bootstrapper.initialize()
        bootstrapper.register {[weak self] in
            self?.window = self?.bootstrapper.initializeUi()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        bootstrapper.terminate {
            
        }
    }
}
