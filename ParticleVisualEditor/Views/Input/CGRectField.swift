//
//  CGRectField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/8/19.
//

import SwiftUI

struct CGRectField<Root, Value>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var rect: CGRect

    var body: some View {
        VStack(alignment: .leading) {
            Text(propertyName)

            Group {
                HStack {
                    Text("x")
                        .dragToChange($rect.origin.x)
                    TextField(propertyName, value: $rect.origin.x, formatter: NumberFormatter.fraction)

                    Text("y")
                        .dragToChange($rect.origin.y)
                    TextField(propertyName, value: $rect.origin.y, formatter: NumberFormatter.fraction)
                }

                HStack {
                    Text("width")
                        .dragToChange($rect.size.width)
                    TextField(propertyName, value: $rect.size.width, formatter: NumberFormatter.fraction)

                    Text("height")
                        .dragToChange($rect.size.height)
                    TextField(propertyName, value: $rect.size.height, formatter: NumberFormatter.fraction)
                }
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
