//
//  DragToChangeModifier.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/8/16.
//

import SwiftUI

struct DragToChangeModifier<T: BinaryFloatingPoint>: ViewModifier {
    @Binding var value: T

    @State private var oldValue: T?

    func body(content: Content) -> some View {
        content
            .frame(minWidth: 20)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if oldValue == nil {
                            oldValue = value
                        }
                        let offset = gesture.translation
                        value = oldValue! + T(offset.width)
                    }
                    .onEnded { _ in
                        oldValue = nil
                    }
            )
        #if targetEnvironment(macCatalyst)
            .onHover { isInside in
                if isInside {
                    NSCursor.resizeLeftRight.push()
                } else {
                    NSCursor.pop()
                }
            }
        #endif
    }
}

extension View {
    func dragToChange<T: BinaryFloatingPoint>(_ value: Binding<T>) -> some View {
        modifier(DragToChangeModifier(value: value))
    }
}
