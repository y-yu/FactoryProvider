//
//  Providable.swift
//  FactoryProvider
//
//  Created by 吉村優 on 2018/06/15.
//  Copyright © 2018年 吉村優. All rights reserved.
//

extension Array: Providable where Element: Providable, Element.S == Int {
    public typealias S = Int
    
    public static func provide() -> State<Int, Array<Element>> {
        return Element.provide().map { e -> Array<Element> in [e] }
    }
}

extension Bool: Providable {
    public typealias S = Int
    
    public static func provide() -> State<Int, Bool> {
        return State<Int, Bool> {
            s -> (Bool, Int) in
                if (s % 2 == 0) {
                    return (true, s + 1)
                } else {
                    return (false, s + 1)
                }
        }
    }
}

extension Int: Providable {
    public typealias S = Int
    
    public static func provide() -> State<Int, Int> {
        return State<Int, Int>{
            (s: Int) -> (Int, Int) in (s, s + 1)
        }
    }
}

extension Optional: Providable where Wrapped: Providable, Wrapped.S == Int {
    public typealias S = Int
    
    public static func provide() -> State<Int, Optional<Wrapped>> {
        return State<Int, Optional<Wrapped>> {
            s -> (Optional<Wrapped>, Int) in
                if (s % 2 == 0) {
                    return Wrapped.provide().map { w -> Optional<Wrapped> in .some(w) }.run(s)
                } else {
                    return (.none, s)
                }
        }
    }
}

extension String: Providable {
    public typealias S = Int
    
    public static func provide() -> State<Int, String> {
        return State<Int, String> {
            (s: Int) -> (String, Int) in (String(s), s + 1)
        }
    }
}
