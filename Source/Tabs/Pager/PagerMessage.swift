//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

struct PagerMessage {
    static let empty = PagerMessage.init(identifier: String.empty, title: nil, description: nil, foregroundColor: nil, backgroundColor: nil, imageUrl: nil)
    
    let identifier: String
    let title: String?
    let description: String?
    let foregroundColor: String?
    let backgroundColor: String?
    let imageUrl: String?
}

extension PagerMessage {
    var isEmpty: Bool {
        get { return self.identifier.isNullOrEmpty }
    }
    
    var kpIdentifier: KeyPath<PagerMessage, String> {
        get { return \PagerMessage.identifier }
    }
}
