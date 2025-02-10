//
//  Binding+Optional.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/9.
//

import SwiftUI

func ?? <T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
