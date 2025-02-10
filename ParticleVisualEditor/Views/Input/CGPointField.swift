//
//  CGPointField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/24.
//

import SwiftUI

struct CGPointField<Root, Value>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var point: CGPoint

    var body: some View {
        VStack(alignment: .leading) {
            Text(propertyName)

            HStack {
                Text("x")
                    .dragToChange($point.x)
                TextField(propertyName, value: $point.x, formatter: NumberFormatter.fraction)

                Text("y")
                    .dragToChange($point.y)
                TextField(propertyName, value: $point.y, formatter: NumberFormatter.fraction)
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
