//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class DrawingMessage: Activable {
    static let empty = DrawingMessage()
    
    let identifier: String = String.empty
    let strokes: [DrawingStroke] = []
    
    required init() {
    }
}

extension DrawingMessage {
    var isEmpty: Bool {
        get { return self.identifier.isNullOrEmpty }
    }
}

struct DrawingStroke {
    static let empty = DrawingStroke()
}
