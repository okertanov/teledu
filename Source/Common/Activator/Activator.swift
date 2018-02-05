//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public typealias ActivableServiceContextInjectable = Activable & ServiceContextInjectable
public typealias ActivableViewModelInjectable = Activable & ViewModelInjectable

public class Activator {
    public static func activate<T: ActivableServiceContextInjectable>(_ type: T.Type) -> T {
        let instance = type.init()
        ServiceLocator.getContext().inject(instance)
        return instance
    }
    
    public static func activate<T: ActivableViewModelInjectable, M: ActivableServiceContextInjectable>(_ type: T.Type, with modelType: M.Type) -> T {
        let instance = type.init()
        let model = modelType.init()
        instance.inject(model as! ViewModel)
        return instance
    }
}
