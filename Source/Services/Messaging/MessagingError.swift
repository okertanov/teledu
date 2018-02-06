//
//  Created by Oleg Kertanov on 04/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

public enum MessagingError: Error {
    case subscriptionError(message: String)
    case historyError(message: String)
}
