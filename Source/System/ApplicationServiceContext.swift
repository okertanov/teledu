//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class ApplicationServiceContext: ServiceContext {
    fileprivate var services: [AnyHashable: Registrable] = [:]
    fileprivate var servicesTree: [AnyHashable: [Registrable]] = [:]
    
    func register<T: Registrable>(_ type: ServiceMetaType, _ service: T) {
        let typeOfService = String.init(describing: type)
        services[typeOfService] = service
    }
    
    func registerMany<T: Registrable>(_ type: ServiceMetaType, _ services: [T]) {
        let typeOfService = String.init(describing: type)
        servicesTree[typeOfService] = services
    }
    
    func resolve<T: Registrable>(_ type: ServiceMetaType) -> T? {
        let typeOfService = String.init(describing: type)
        if let resolved = services[typeOfService] {
            return resolved as? T
        }
        return nil
    }
    
    func resolveAll<T: Registrable>(_ type: ServiceMetaType) -> [T]? {
        let typeOfService = String.init(describing: type)
        if let resolved = servicesTree[typeOfService] {
            return resolved as? [T]
        }
        return nil
    }
    
    func inject(_ target: ServiceContextInjectable) {
        target.inject(self)
    }
}
