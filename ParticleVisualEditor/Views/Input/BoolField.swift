//
//  BoolField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/27.
//

import SwiftUI

struct BoolField<Root, Value>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var value: Bool

    var body: some View {
        Toggle(isOn: $value) {
            Text(propertyName)
        }
    }
}
