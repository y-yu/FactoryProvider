//
//  HList.swift
//  FactoryProvider
//
//  Created by 吉村優 on 2018/06/15.
//  Copyright © 2018年 吉村優. All rights reserved.
//

public protocol HList { }
public struct HNil: HList {
    init() { }
}

public struct HCons<H, T: HList>: HList {
    public let head: H
    public let tail: T
    
    public init(_ h: H, _ t: T) {
        self.head = h
        self.tail = t
    }
}
