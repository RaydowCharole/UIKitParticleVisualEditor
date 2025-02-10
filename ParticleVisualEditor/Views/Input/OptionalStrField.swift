//
//  OptionalStrField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/9.
//

import SwiftUI

struct OptionalStrField<Root, Value>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var value: String?

    var body: some View {
        HStack {
            Text(propertyName)

            TextField(propertyName, text: $value ?? "")
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Image(systemName: value == nil ? "delete.left" : "delete.left.fill")
                .foregroundStyle(value == nil ? .black : .blue)
                .onTapGesture {
                    value = nil
                }
        }
    }
}

