//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class ApplicationServiceContext: ServiceContext {
    fileprivate var services: [AnyHashable: Service] = [:]
    
    func register<T>(_ type: ServiceMetaType, _ service: T) where T : Service {
        let typeOfService = String.init(describing: service)
        services[typeOfService] = service
    }
    
    func registerMany<T>(_ type: ServiceMetaType, _ services: [T]) where T : Service {
        for service in services {
            register(type, service)
        }
    }
    
    func resolve<T: Service>(_ type: ServiceMetaType) -> T? {
        var resolvedServices: [Service] = []
        for service in services {
            let typeOfService = String.init(describing: service)
            if let resolved = services[typeOfService] {
                resolvedServices.append(resolved)
            }
        }
        return resolvedServices.last as? T
    }
    
    func resolveAll<T: Service>(_ type: ServiceMetaType) -> [T]? {
        var resolvedServices: [Service] = []
        for service in services {
            let typeOfService = String.init(describing: service)
            if let resolved = services[typeOfService] {
                resolvedServices.append(resolved)
            }
        }
        return resolvedServices as? [T]
    }
    
    func inject(_ target: ServiceContextInjectable) {
        target.inject(self)
    }
}
