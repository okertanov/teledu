//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    func subViewsOf<T : UIView>(type : T.Type) -> [T] {
        var allSubviews = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T {
                allSubviews.append(aView)
            }
            guard view.subviews.count > 0 else { return }
            view.subviews.forEach { getSubview(view: $0) }
        }
        getSubview(view: self)
        return allSubviews
    }
}
