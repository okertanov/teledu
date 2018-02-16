//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

//
// Empty placeholder item
//
class SysInfoEmptyViewModel: SysInfoDetailsViewModel {
    override var itemsCount: Int {
        return 0
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        return nil
    }
    
    override var backgroundImageName: String? {
        return nil
    }
}
