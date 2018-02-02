//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public protocol ServiceContext : class {
    typealias ServiceMetaType = Service.Type
    
    func register<T: Service>(_ service: T)
    func registerMany<T>(_ services: [T]) where T : Service
    
    func resolve<T: Service>(_ type: ServiceMetaType) -> T?
    func resolveAll<T: Service>(_ type: ServiceContext.ServiceMetaType) -> [T]?
    
    func inject(_ target: ServiceContextInjectable)
}
