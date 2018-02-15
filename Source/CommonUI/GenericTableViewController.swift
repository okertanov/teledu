//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

open class GenericTableViewController<TViewModel: ViewModel>: UITableViewController, Activable, ViewModelInjectable {
    open private(set) var model: TViewModel?
    
    convenience init(model: TViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.model = model
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func inject(_ model: ViewModel) {
        self.model = model as? TViewModel
    }
}
