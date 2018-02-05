//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class PagerViewController: GenericViewController {
    private enum Channels : String {
        case teledu = "teledu-pager"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (model as! PagerViewModel).subscribe(to: Channels.teledu.rawValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        (model as! PagerViewModel).unsubscribe(from: Channels.teledu.rawValue)
    }
}
