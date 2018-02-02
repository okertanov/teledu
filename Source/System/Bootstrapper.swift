//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class Bootstrapper {
    
    func initialize() {
        initializeImpl()
    }
    
    func register(_ completion: CommonTypes.VoidBlockType?) {
        registerImpl()
        completion?()
    }
    
    func terminate(_ completion: CommonTypes.VoidBlockType?) {
        terminateImpl()
        completion?()
    }
    
    fileprivate func initializeImpl() {
    }
    
    fileprivate func registerImpl() {
    }
    
    fileprivate func terminateImpl() {
    }
}
