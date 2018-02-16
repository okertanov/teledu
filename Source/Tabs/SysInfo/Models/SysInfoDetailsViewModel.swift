//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

//
// Abstract model
//
class SysInfoDetailsViewModel: ViewModel {
    typealias SysInfoItem = (title: String, description: String)
    
    var itemsCount: Int {
        return NSNotFound
    }
    
    func getItemAt(_ idx: Int) -> SysInfoItem? {
        return nil
    }
    
    var backgroundImageName: String? {
        return nil
    }
}
