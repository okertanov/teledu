//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public class CommonTypes {
    public typealias VoidBlockType = () -> Void
    public typealias PredicateBlockType<T> = (_ t: T) -> Bool
    public typealias GenericBlockTypeR<Ret> = () -> Ret
    public typealias GenericBlockTypePR<Param, Ret> = (_ p: Param) -> Ret
    public typealias GenericBlockTypePPR<Param1, Param2, Ret> = (_ p1: Param1, _ p2: Param2) -> Ret
}
