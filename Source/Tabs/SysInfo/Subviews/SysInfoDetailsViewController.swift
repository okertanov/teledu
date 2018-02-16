//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

//
// SysInfoDetailsViewController class
//
class SysInfoDetailsViewController: GenericTableViewController<SysInfoDetailsViewModel> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if model!.itemsCount <= 0 {
            tableView.isHidden = true
        }
        else {
            tableView.reloadData()
        }
    }
    
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
