//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public extension NSObject {
    var typename: String {
        return String(describing: self.self)
    }
}
