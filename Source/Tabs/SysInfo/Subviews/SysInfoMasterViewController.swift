//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class SysInfoMasterViewModel: ViewModel {
    let menuItems = ["Network", "OS Info", "Hardware"]
    
    public let propertyChanged = Event<AnyKeyPath>()
    
    public var selectedItem: Int = NSNotFound {
        didSet { propertyChanged.raise(\SysInfoMasterViewModel.selectedItem) }
    }
}

class SysInfoMasterViewController: GenericTableViewController<SysInfoMasterViewModel> {
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        if let cell = tableView.cellForRow(at: IndexPath.init(row: model!.selectedItem, section: 0)) {
            return [cell]
        }
        else {
            return []
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model!.selectedItem = NSNotFound
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.menuItems.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SysInfoMasterViewCell", for: indexPath)
        cell.textLabel?.text = model!.menuItems[indexPath.row]
        return cell
    }
    
    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        return super.shouldUpdateFocus(in: context)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        if let cell = context.nextFocusedItem as? UITableViewCell {
            if let indexPath = tableView.indexPath(for: cell) {
                model!.selectedItem = indexPath.row
            }
        }
        else {
            model!.selectedItem = NSNotFound
        }
    }
    
    override public func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {
        let indexPath = IndexPath.init(row: model!.selectedItem, section: 0)
        return indexPath
    }
}
