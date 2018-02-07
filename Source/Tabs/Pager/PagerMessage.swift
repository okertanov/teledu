//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

class PagerMessage: Activable {
    static let empty = PagerMessage()
    
    private(set) var identifier: String = String.empty
    private(set) var text: String? = nil
    private(set) var description: String? = nil
    private(set) var foregroundColor: String? = nil
    private(set) var backgroundColor: String? = nil
    private(set) var imageUrl: String? = nil
    
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
    
    convenience init(identifier: String, text: String?, description: String?, foregroundColor: String?, backgroundColor: String?, imageUrl: String?) {
        self.init()
        self.identifier = identifier
        self.text = text
        self.description = description
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.imageUrl = imageUrl
    }
}
