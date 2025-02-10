//
//  CasePicker.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/24.
//

import SwiftUI

protocol PickerEnum: Hashable, CaseIterable where AllCases: RandomAccessCollection {
    var displayName: String { get }
}

struct CasePicker<Root, Value, T: PickerEnum>: View {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    var selection: Binding<T>

    var body: some View {
        HStack {
            Text(propertyName)
            Spacer()
            Picker(propertyName, selection: selection) {
                ForEach(T.allCases, id: \.self) {
                    Text($0.displayName).tag($0)
                }
            }
        }
    }
}

struct StrCasePicker<Root, Value, Data: RandomAccessCollection>: View where Data.Element: Identifiable & RawRepresentable, Data.Element.RawValue: StringProtocol {
    let keyPath: KeyPath<Root, Value>
    var propertyName: String {
        NSExpression(forKeyPath: keyPath).keyPath
    }

    @Binding var selection: String
    var selections: Data

    var body: some View {
        HStack {
            Text(propertyName)
            Spacer()
            Picker(propertyName, selection: $selection) {
                ForEach(selections) {
                    Text($0.rawValue).tag($0.rawValue)
                }
            }
        }
    }
}
