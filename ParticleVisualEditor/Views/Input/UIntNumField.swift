//
//  UIntNumField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/8/16.
//

import SwiftUI

struct UIntNumField<Root, Value, T: BinaryInteger>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var value: T

    var body: some View {
        HStack {
            Text(propertyName)
                .frame(minWidth: 160, alignment: .leading)

            TextField(propertyName, value: $value, formatter: NumberFormatter.fraction)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
