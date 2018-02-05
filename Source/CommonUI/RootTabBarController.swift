//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class RootTabBarController: UITabBarController, UITabBarControllerDelegate, Activable, ViewModelInjectable {
    open private(set) var model: ViewModel?
    
    override var selectedIndex: Int {
        get {
            return (model as! RootTabBarViewModel).selectedIndex
        }
        set {
            (model as! RootTabBarViewModel).selectedIndex = newValue
            super.selectedIndex = newValue
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

        let vc1 = ViewLocator.locateVC(PagerViewController.self, PagerViewModel.self)!
        let vc2 = ViewLocator.locateVC(DrawingViewController.self, DrawingViewModel.self)!
        let newViewControllers = [vc1, vc2]

        setViewControllers(newViewControllers, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    public func inject(_ model: ViewModel) {
        self.model = model
    }
}
