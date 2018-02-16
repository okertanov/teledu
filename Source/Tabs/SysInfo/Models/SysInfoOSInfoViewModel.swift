//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

//
// OS Info menu item
//
class SysInfoOSInfoViewModel: SysInfoDetailsViewModel {
    var entries: [String: CommonTypes.GenericBlockTypeR<String>] = [
        "Platform": SysInfoOSInfoViewModel.getPlatformName,
        "Version": SysInfoOSInfoViewModel.getPlatformVersion,
        "Identifier": SysInfoOSInfoViewModel.getDeviceIdentifier,
    ]
    
    override var itemsCount: Int {
        return entries.count
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        let entrie = entries.dropFirst(idx).first!
        return SysInfoItem(title: entrie.key, description: entrie.value())
    }
    
    private static func getPlatformName() -> String {
        let name = UIDevice.current.localizedModel
        return name
    }
    
    private static func getPlatformVersion() -> String {
        let version = "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
        return version
    }
    
    private static func getDeviceIdentifier() -> String {
        let identifier =  UIDevice.current.identifierForVendor?.uuidString ?? "Unknown"
        return identifier
    }
}
