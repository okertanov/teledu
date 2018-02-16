//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

//
// Hardware menu item
//
class SysInfoHardwareViewModel: SysInfoDetailsViewModel{
    var entries: [String: CommonTypes.GenericBlockTypeR<String>] = [
        "RAM": SysInfoHardwareViewModel.getStub,
        "CPU": SysInfoHardwareViewModel.getStub,
        "Total disk space": SysInfoHardwareViewModel.getStub,
        "Free disk space": SysInfoHardwareViewModel.getStub
    ]
    
    override var itemsCount: Int {
        return entries.count
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        let entrie = entries.dropFirst(idx).first!
        return SysInfoItem(title: entrie.key, description: entrie.value())
    }
    
    private static func getStub() -> String {
        return String.empty
    }
}
