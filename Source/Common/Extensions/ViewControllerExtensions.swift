//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    public func setTabBarVisible(_ visible: Bool) {
        self.tabBarController?.tabBar.isHidden = !visible
    }
    
    public func toggleTabBarVisible(animated: Bool) {
        if let tabBarController = self.tabBarController {
            let tabBarOffset = tabBarController.tabBar.frame.size.height
            let tabBarY = tabBarController.tabBar.frame.origin.y
            let hidden = tabBarY < 0
            let yOffset = CGFloat((hidden ? tabBarOffset * 1.0 : tabBarOffset * -1.0))
            let newFrame = tabBarController.tabBar.frame.offsetBy(dx: 0.0, dy: yOffset)
            if (animated) {
                UIView.animate(withDuration: 0.5, animations: {
                    tabBarController.tabBar.frame = newFrame
                }, completion: {_ in
                })
            }
            else {
                tabBarController.tabBar.frame = newFrame
            }
        }
    }
}
