//
//  CAEmitter+ValueCast.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/24.
//

import SwiftUI

extension View {
    func hideKeyboard() -> some View {
        onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

extension NumberFormatter {
    static let fraction = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = false
        formatter.maximumFractionDigits = 5
        return formatter
    }()
}

extension CAEmitterLayerRenderMode: PickerEnum {
    var displayName: String {
        rawValue
    }

    public static var allCases: [CAEmitterLayerRenderMode] {
        [
            unordered,
            oldestFirst,
            oldestLast,
            backToFront,
            additive,
        ]
    }
}

extension CAEmitterLayerEmitterShape: PickerEnum {
    var displayName: String {
        rawValue
    }

    public static var allCases: [CAEmitterLayerEmitterShape] {
        [
            circle,
            cuboid,
            line,
            point,
            rectangle,
            sphere,
        ]
    }
}

extension CAEmitterLayerEmitterMode: PickerEnum {
    var displayName: String {
        rawValue
    }

    public static var allCases: [CAEmitterLayerEmitterMode] {
        [
            outline,
            points,
            surface,
            volume,
        ]
    }
}

extension CALayerContentsFilter: Identifiable {
    public var id: String {
        rawValue
    }

    public static var allCases: [CALayerContentsFilter] {
        [
            linear,
            nearest,
            trilinear,
        ]
    }
}
