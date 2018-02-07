//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class BrowserMessage: Activable {
    static let empty = BrowserMessage()
    
    let identifier: String = String.empty
    let url: URL = URL.blank
    
    required init() {
    }
}

extension BrowserMessage {
    var isEmpty: Bool {
        get { return self.identifier.isNullOrEmpty }
    }
}

extension URL {
    static var blank: URL {
        get { return URL(string: "about:blank")! }
    }
}
