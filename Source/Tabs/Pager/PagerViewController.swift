//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class PagerViewController: GenericViewController<PagerViewModel> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model!.subscribe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        model!.unsubscribe()
    }
}
