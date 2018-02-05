//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public class ViewModel : Activable, ServiceContextInjectable {
    open private(set) var serviceContext: ServiceContext?
    
    public required init() {
    }
    
    public func inject(_ context: ServiceContext) {
        self.serviceContext = context
    }
}
