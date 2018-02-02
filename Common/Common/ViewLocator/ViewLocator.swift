//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

open class ViewLocator {
    enum DefaultStoryBoards : String {
        case main = "Main"
        case login = "Login"
    }
    
    public class func locateVC<T: UIViewController>(_ vc: T, in storyboard: UIStoryboard? = nil) -> T? {
        let vcName = vc.typename
        let storyboard = storyboard ?? UIStoryboard.init(name: DefaultStoryBoards.main.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcName) as? T
        return vc
    }
}
