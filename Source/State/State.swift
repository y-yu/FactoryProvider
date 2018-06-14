//
//  State.swift
//  FactoryProvider
//
//  Created by 吉村優 on 2018/06/15.
//  Copyright © 2018年 吉村優. All rights reserved.
//

public struct State<S, A> {
    public let run : (S) -> (A, S)
    
    public init(_ run : @escaping (S) -> (A, S)) {
        self.run = run
    }
    
    func flatMap<B>(_ f: @escaping (A) -> State<S, B>) -> State<S, B> {
        return State<S, B> {
            (s: S) -> (B, S) in
                let (a, s1) = self.run(s)
                return f(a).run(s1)
        }
    }
    
    func map<B>(_ f: @escaping (A) -> B) -> State<S, B> {
        return State<S, B> {
            (s: S) -> (B, S) in
                let (a, s1) = self.run(s)
                return (f(a), s1)
        }
    }
}

