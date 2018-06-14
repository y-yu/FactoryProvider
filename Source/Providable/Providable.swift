//
//  Providable.swift
//  FactoryProvider
//
//  Created by 吉村優 on 2018/06/15.
//  Copyright © 2018年 吉村優. All rights reserved.
//

public protocol Providable {
    associatedtype S
    
    static func provide() -> State<S, Self>
}

precedencegroup Right {
    associativity: right
}

infix operator >>>: Right

public func >>><S, A, T: HList>(_ ma: State<S, A>, _ mb: State<S, T>) -> State<S, HCons<A, T>> {
    return ma.flatMap {
        (a: A) -> State<S, HCons<A, T>> in
            mb.map {
                (t: T) -> HCons<A, T> in HCons<A, T>(a, t)
            }
    }
}

public func end<S>() -> State<S, HNil> {
    return State<S, HNil> {
        s -> (HNil, S) in (HNil(), s)
    }
}
