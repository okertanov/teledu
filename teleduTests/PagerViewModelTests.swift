//
//  Created by Oleg Kertanov on 06/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import XCTest
@testable import teledu

class PagerViewModelTests: XCTestCase {
    var bootstrapper: Bootstrapper?
    
    override func setUp() {
        super.setUp()
        
        bootstrapper = Bootstrapper()
        bootstrapper!.initialize()
        bootstrapper!.register() {}
    }
    
    override func tearDown() {
        bootstrapper!.terminate() {}
        
        super.tearDown()
    }
    
    func testPagerMessage() {
        let emptyMessage = PagerMessage.empty
        XCTAssertTrue(emptyMessage.isEmpty)
        
        let message = PagerMessage(identifier: "0",
                                   title: "Hello",
                                   description: "My Message",
                                   foregroundColor: "white",
                                   backgroundColor: "black",
                                   imageUrl: "file://image.png")
        XCTAssertFalse(message.isEmpty)
        
        XCTAssertEqual(message[keyPath: message.kpIdentifier], message.identifier)
    }
    
    func testCreatePagerViewModel() {
        let model = Activator.activate(PagerViewModel.self)
        
        XCTAssertNotNil(model)
        XCTAssertNotNil(model.serviceContext)
        XCTAssertNotNil(model.message)
        XCTAssertTrue(model.message.isEmpty)
        XCTAssertNotNil(model.history)
        XCTAssertEqual(model.history.count, 0)
    }
}
