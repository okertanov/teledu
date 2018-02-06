//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class PagerViewController: GenericViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (model as! PagerViewModel).subscribe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        (model as! PagerViewModel).unsubscribe()
    }
}
