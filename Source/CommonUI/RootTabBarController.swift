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
        let vc3 = ViewLocator.locateVC(BrowserViewController.self, BrowserViewModel.self)!
        let vc4 = ViewLocator.locateVC(SysInfoViewController.self, SysInfoViewModel.self)!
        let newViewControllers = [vc1, vc2, vc3, vc4 ]

        setViewControllers(newViewControllers, animated: false)
        
        configureRecognizers()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    public func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    public func inject(_ model: ViewModel) {
        self.model = model
    }
    
    private func configureRecognizers() {
        let tapMenuRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapMenu(_:)))
        tapMenuRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.menu.rawValue)]
        
        let tapPlayPauseRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapPlayPause(_:)))
        tapPlayPauseRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.playPause.rawValue)]
        
        let tapSelectRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapSelect(_:)))
        tapSelectRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.select.rawValue)]
        
        let tapArrowRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTapArrow(_:)))
        tapArrowRecognizer.allowedPressTypes = [
            NSNumber(value: UIPressType.leftArrow.rawValue),
            NSNumber(value: UIPressType.rightArrow.rawValue),
            NSNumber(value: UIPressType.upArrow.rawValue),
            NSNumber(value: UIPressType.downArrow.rawValue)
        ]
        
        self.view.addGestureRecognizer(tapMenuRecognizer)
        self.view.addGestureRecognizer(tapPlayPauseRecognizer)
        self.view.addGestureRecognizer(tapSelectRecognizer)
        self.view.addGestureRecognizer(tapArrowRecognizer)
        
        self.view.isUserInteractionEnabled = true
    }
    
    @objc private func onTapMenu(_ sender: UITapGestureRecognizer) {
        print("TapMenu")
        self.selectedViewController?.toggleTabBarVisible(animated: true)
    }
    
    @objc private func onTapPlayPause(_ sender: UITapGestureRecognizer) {
        print("TapPlayPause")
        // Next ViewController
        selectedIndex = (selectedIndex + 1) % (viewControllers?.count ?? 0)
        print(">>>>> ", selectedIndex)
    }
    
    @objc private func onTapSelect(_ sender: UITapGestureRecognizer) {
        print("TapSelect")
    }
    
    @objc private func onTapArrow(_ sender: UITapGestureRecognizer) {
        print("TapArrow", sender)
    }
}
