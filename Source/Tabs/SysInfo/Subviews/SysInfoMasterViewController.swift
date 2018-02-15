//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class SysInfoMasterViewModel: ViewModel {
    let menuItems = ["Network", "OS Info", "Hardware"]
}

class SysInfoMasterViewController: GenericTableViewController<SysInfoMasterViewModel> {
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.menuItems.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SysInfoMasterViewCell", for: indexPath)
        cell.textLabel?.text = model!.menuItems[indexPath.row]
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
