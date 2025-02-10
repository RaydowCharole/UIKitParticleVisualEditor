//
//  CGSizeField.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/28.
//

import SwiftUI

struct CGSizeField<Root, Value>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var size: CGSize

    var body: some View {
        VStack(alignment: .leading) {
            Text(propertyName)

            HStack {
                Text("width")
                    .dragToChange($size.width)
                TextField(propertyName, value: $size.width, formatter: NumberFormatter.fraction)

                Text("height")
                    .dragToChange($size.height)
                TextField(propertyName, value: $size.height, formatter: NumberFormatter.fraction)
            }
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
