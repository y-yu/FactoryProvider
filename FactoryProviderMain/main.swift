//
//  main.swift
//  FactoryProviderMain
//
//  Created by 吉村優 on 2018/06/15.
//  Copyright © 2018年 吉村優. All rights reserved.

let a =
    String.provide() >>>
    Bool.provide() >>>
    Optional<Int>.provide() >>>
    end()

let (b, s) = a.run(0)

print(s, b.head, b.tail.head, b.tail.tail.head as Any)
