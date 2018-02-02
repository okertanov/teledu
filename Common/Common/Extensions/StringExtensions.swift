//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public protocol StringType {
    var isEmpty: Bool { get }
}

extension String : StringType {
    public static var empty: String {
        return ""
    }
    
    public var isNullOrEmpty: Bool {
        return self.isEmpty
    }
}

public extension Optional where Wrapped: StringType {
    var isNullOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}

public extension String {
    func truncate(length: Int, trailing: String = "\u{2026}") -> String {
        if self.count > length {
            return String(self.characters.prefix(length)) + trailing
        }
        else {
            return self
        }
    }
}
