//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public protocol ViewModelInjectable : class {
    func inject(_ model: ViewModel)
}
