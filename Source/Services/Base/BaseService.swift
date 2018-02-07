//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class BaseService: Registrable, Activable, ServiceContextInjectable {
    open private(set) var serviceContext: ServiceContext?
    
    public required init() {
    }
    
    public func inject(_ context: ServiceContext) {
        self.serviceContext = context
    }
}
