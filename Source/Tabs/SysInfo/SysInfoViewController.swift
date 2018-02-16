//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class SysInfoViewController: GenericSplitViewController<SysInfoViewModel> {
    private var masterVcModelpropertyChangedToken: Disposable?
    
    private lazy var masterVc = ViewLocator.locateVC(SysInfoMasterViewController.self, SysInfoMasterViewModel.self)!
    private lazy var masterNc = embeddIntoNavigationController(masterVc)
    private lazy var detailsNc = UINavigationController()
    private lazy var detailVcs = [
        ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoNetworkViewModel.self)!,
        ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoOSInfoViewModel.self)!,
        ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoHardwareViewModel.self)!
    ]
    private lazy var emptyPlaceholderVc = ViewLocator.locateVC(SysInfoDetailsViewController.self, SysInfoEmptyViewModel.self)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = UIColor.black
        
        masterVcModelpropertyChangedToken = masterVc.model!.propertyChanged.addHandler(target: masterVc.model!, onMasterVcModelPropertyChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func configureSplitViewController() {
        viewControllers = [masterNc, detailsNc]
        
        super.configureSplitViewController()
    }
    
    private func embeddIntoNavigationController(_ viewController: UIViewController) -> UINavigationController {
        let embedded = UINavigationController.init(rootViewController: viewController)
        return embedded
    }
    
    private func embeddIntoNavigationController(_ viewControllers: [UIViewController]) -> [UINavigationController] {
        let embedded = viewControllers.map { return embeddIntoNavigationController($0) }
        return embedded
    }
    
    private func onMenuItemSelected(_ selected: Int) {
        if detailVcs.indices.contains(selected) {
            navigateToDetailVc(detailVcs[selected])
        }
        else {
            navigateToDetailVc(emptyPlaceholderVc)
        }
    }
    
    private func navigateToDetailVc(_ vc: UIViewController) {
        masterNc.showDetailViewController(vc, sender: self)
    }
    
    private func onMasterVcModelPropertyChanged(_ sender: SysInfoMasterViewModel, _ property: AnyKeyPath) {
        switch property {
        case \SysInfoMasterViewModel.selectedItem:
            print("Selected item:", sender.selectedItem)
            onMenuItemSelected(sender.selectedItem)
        default: do {
            // Nothing
            }
        }
    }
    
    deinit {
        masterVcModelpropertyChangedToken?.dispose()
    }
}
