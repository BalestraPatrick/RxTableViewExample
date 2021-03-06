//
//  IdentifiableValue.swift
//  RxDataSources
//
//  Created by Krunoslav Zaher on 1/7/16.
//  Copyright © 2016 Krunoslav Zaher. All rights reserved.
//

import Foundation

public struct IdentitifiableValue<Value: Hashable> : IdentifiableType, Equatable {
    public typealias Identity = Value

    public let value: Value

    public var identity : Identity {
        return value
    }
}

public func == <V: Hashable>(lhs: IdentitifiableValue<V>, rhs: IdentitifiableValue<V>) -> Bool {
    return lhs.value == rhs.value
}