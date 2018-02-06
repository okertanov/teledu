//
//  Created by Oleg Kertanov on 03/02/2018.
//  Copyright © 2018 lexiko.me. All rights reserved.
//

import Foundation

//
// See http://blog.scottlogic.com/2015/02/05/swift-events.html
//
public class Event<U> {
    public typealias EventHandler = (U) -> ()
    fileprivate var eventHandlers = [Invocable]()

    public init() {
    }

    public func raise(_ data: U) {
        for handler in self.eventHandlers {
            handler.invoke(data)
        }
    }

    public func addHandler<T: AnyObject>(target: T, _ handler: @escaping (T, U) -> Void) -> Disposable {
        let wrapper = EventHandlerWrapper(target: target, handler: handler, event: self)
        eventHandlers.append(wrapper)
        return wrapper
    }

    public func removeHandler(_ handler: Invocable) {
        eventHandlers = eventHandlers.filter { $0 !== handler }
    }
}

private class EventHandlerWrapper<T: AnyObject, U>
: Invocable, Disposable {
    weak var target: T?
    let handler: (T, U) -> ()
    let event: Event<U>

    init(target: T?, handler: @escaping (T, U) -> (), event: Event<U>) {
        self.target = target
        self.handler = handler
        self.event = event;
    }

    func invoke(_ data: Any) -> () {
        if let t = target {
            handler(t, data as! U)
        }
    }

    func dispose() {
        event.eventHandlers = event.eventHandlers.filter { $0 !== self }
    }
}
