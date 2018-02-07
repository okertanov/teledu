//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public protocol ServiceContext : class {
    typealias ServiceMetaType = Protocol
    
    func register<T: Registrable>(_ type: ServiceMetaType, _ service: T)
    func registerMany<T: Registrable>(_ type: ServiceMetaType, _ services: [T])
    
    func resolve<T: Registrable>(_ type: ServiceMetaType) -> T?
    func resolveAll<T: Registrable>(_ type: ServiceMetaType) -> [T]?
    
    func inject(_ target: ServiceContextInjectable)
}
