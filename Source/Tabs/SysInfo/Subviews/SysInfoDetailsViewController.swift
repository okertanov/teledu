//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

//
// Abstract model
//
class SysInfoDetailsViewModel: ViewModel {
    typealias SysInfoItem = (title: String, description: String)
    
    var itemsCount: Int {
        return 0
    }
    
    func getItemAt(_ idx: Int) -> SysInfoItem? {
        return nil
    }
}

//
// Network menu item
//
class SysInfoNetworkViewModel: SysInfoDetailsViewModel{
    override var itemsCount: Int {
        return 1
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        return SysInfoItem(title: idx.description, description: idx.description)
    }
}

//
// OS Info menu item
//
class SysInfoOSInfoViewModel: SysInfoDetailsViewModel{
    override var itemsCount: Int {
        return 3
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        return SysInfoItem(title: idx.description, description: idx.description)
    }
}

//
// Hardware menu item
//
class SysInfoHardwareViewModel: SysInfoDetailsViewModel{
    override var itemsCount: Int {
        return 5
    }
    
    override func getItemAt(_ idx: Int) -> SysInfoItem? {
        return SysInfoItem(title: idx.description, description: idx.description)
    }
}

//
// SysInfoDetailsViewController class
//
class SysInfoDetailsViewController: GenericTableViewController<SysInfoDetailsViewModel> {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.itemsCount
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SysInfoDetailsViewCell", for: indexPath)
        let sysInfoItem = model!.getItemAt(indexPath.row)
        cell.textLabel?.text = sysInfoItem?.title
        cell.detailTextLabel?.text = sysInfoItem?.description
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
