//
//  Created by Oleg Kertanov on 02/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation
import UIKit

class PagerViewController: GenericViewController<PagerViewModel> {
    private var propertyChangedToken: Disposable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        propertyChangedToken = model!.propertyChanged.addHandler(target: model!, onModelPropertyChanged)
        
        model!.subscribe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func onModelPropertyChanged(_ sender: PagerViewModel, _ property: AnyKeyPath) {
        switch property {
        case \PagerViewModel.connected:
            connectionChanged(sender.connected)
        case \PagerViewModel.message:
            renderMessage(sender.message)
        case \PagerViewModel.history:
            renderHistory(sender.history)
        default: do {
                // Nothing
            }
        }
    }
    
    private func connectionChanged(_ connected: Bool) {
        if connected {
            model!.fetchHistory()
        }
    }
    
    private func renderMessage(_ message: PagerMessage) {
        
    }
    
    private func renderHistory(_ history: [PagerMessage]) {
        
    }
    
    deinit {
        model!.unsubscribe()
        propertyChangedToken?.dispose()
    }
}
