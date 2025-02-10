//
//  OptionalColorField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/9.
//

import SwiftUI

struct OptionalColorField<Root, Value>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var value: CGColor?

    var body: some View {
        ColorPicker(selection: $value ?? CGColor(red: 0, green: 0, blue: 0, alpha: 0), supportsOpacity: true) {
            Text(propertyName)
        }
    }
}
