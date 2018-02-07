//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

struct DrawingMessage {
    static let empty = DrawingMessage(identifier: String.empty)
    
    let identifier: String
    let strokes: [DrawingStroke] = []
}

extension DrawingMessage {
    var isEmpty: Bool {
        get { return self.identifier.isNullOrEmpty }
    }
}

struct DrawingStroke {
    static let empty = DrawingStroke()
}
