//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

open class ServiceLocator {
    private var context: ServiceContext
    private static var instance: ServiceLocator?
    
    private init(_ context: ServiceContext) {
        self.context = context
    }
    
    public static func setContext(_ context: ServiceContext) {
        instance = ServiceLocator(context)
    }
    
    public static func getContext() -> ServiceContext {
        return instance!.getContext()
    }
    
    public static func resolve<T: Registrable>(_ type: ServiceContext.ServiceMetaType) -> T? {
        return instance!.resolve(type)
    }
    
    public static func resolveAll<T: Registrable>(_ type: ServiceContext.ServiceMetaType) -> [T]? {
        return instance!.resolveAll(type)
    }
    
    private func getContext() -> ServiceContext {
        return context
    }
    
    private func resolve<T: Registrable>(_ type: ServiceContext.ServiceMetaType) -> T? {
        return context.resolve(type)
    }
    
    private func resolveAll<T: Registrable>(_ type: ServiceContext.ServiceMetaType) -> [T]? {
        return context.resolveAll(type)
    }
}
