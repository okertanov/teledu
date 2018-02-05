//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

open class ViewLocator {
    enum DefaultStoryBoards : String {
        case main = "Main"
        case login = "Login"
    }
    
    public class func locateVC<T: UIViewController>(_ vcType: T.Type, in storyboard: UIStoryboard? = nil) -> T? {
        let vcName = String(describing: vcType)
        let storyboard = storyboard ?? UIStoryboard.init(name: DefaultStoryBoards.main.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcName) as? T
        return vc
    }
    
    public class func locateView<T: UIView>(_ viewType: T.Type, inBundle bundle: Bundle = Bundle.main) -> T? {
        let viewName = String(describing: viewType)
        if let objects = bundle.loadNibNamed(viewName, owner: nil) {
            for object in objects {
                if let object = object as? T {
                    return object
                }
            }
        }
        return nil
    }
}
