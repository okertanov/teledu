//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

struct BrowserMessage {
    static let empty = BrowserMessage(identifier: String.empty, url: URL.blank)
    
    let identifier: String
    let url: URL
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
