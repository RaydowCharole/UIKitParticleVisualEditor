//
//  FractionNumField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/24.
//

import SwiftUI

struct FractionNumField<Root, Value, T: BinaryFloatingPoint>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var value: T

    var body: some View {
        HStack {
            Text(propertyName)
                .dragToChange($value)
                .frame(minWidth: 160, alignment: .leading)

            TextField(propertyName, value: $value, formatter: NumberFormatter.fraction)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
