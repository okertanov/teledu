//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class PagerMessage: Activable {
    static let empty = PagerMessage()
    
    let identifier: String = String.empty
    let text: String? = nil
    let description: String? = nil
    let foregroundColor: String? = nil
    let backgroundColor: String? = nil
    let imageUrl: String? = nil
    
    required init() {
    }
}

extension PagerMessage {
    var isEmpty: Bool {
        get { return self.identifier.isNullOrEmpty }
    }
    
    var kpIdentifier: KeyPath<PagerMessage, String> {
        get { return \PagerMessage.identifier }
    }
}
