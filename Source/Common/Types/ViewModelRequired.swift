//
//  Created by Oleg Kertanov on 07/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

@objc public protocol ViewModelRequired {
    @objc var title: String { get }
    @objc optional var description: String { get }
}
