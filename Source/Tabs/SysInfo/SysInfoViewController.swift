//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class SysInfoViewController: GenericSplitViewController<SysInfoViewModel> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        show(viewControllers[0], sender: self)
        viewControllers[0].view.backgroundColor = UIColor.red
        showDetailViewController(viewControllers[1], sender: self)
        viewControllers[1].view.backgroundColor = UIColor.green
    }
    
    override func configureSplitViewController() {
        let masterVc = ViewLocator.locateVC(SysInfoMasterViewController.self, SysInfoMasterViewModel.self)!
        let detailsVc1 = ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoNetworkViewModel.self)!
        let detailsVc2 = ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoOSInfoViewModel.self)!
        let detailsVc3 = ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoHardwareViewModel.self)!
        viewControllers = [masterVc, detailsVc1, detailsVc2, detailsVc3]
        
        super.configureSplitViewController()
    }
}
