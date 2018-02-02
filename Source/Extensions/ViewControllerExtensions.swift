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
}
