//
//  EmitterLayerPanel.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/27.
//

import SwiftUI

struct EmitterLayerPanel: View {
    @EnvironmentObject var vm: ParticlePreviewVM
    @State var isExpanded = true

    var body: some View {
        HStack {
            PanelTitle("CAEmitterLayer")

            Button {
                withAnimation {
                    isExpanded.toggle()
                }
            } label: {
                isExpanded ? Image(systemName: "chevron.down.circle") : Image(systemName: "chevron.left.circle")
            }
            .buttonStyle(BorderedButtonStyle())
        }

        if isExpanded {
            /// Emitter Geometry
            Group {
                CasePicker(keyPath: \CAEmitterLayer.renderMode, selection: $vm.caEmitterLayer.renderMode)
                CGPointField(keyPath: \CAEmitterLayer.emitterPosition, point: $vm.caEmitterLayer.emitterPosition)
                CasePicker(keyPath: \CAEmitterLayer.emitterShape, selection: $vm.caEmitterLayer.emitterShape)
                FractionNumField(keyPath: \CAEmitterLayer.emitterZPosition, value: $vm.caEmitterLayer.emitterZPosition)
                FractionNumField(keyPath: \CAEmitterLayer.emitterDepth, value: $vm.caEmitterLayer.emitterDepth)
                CGSizeField(keyPath: \CAEmitterLayer.emitterSize, size: $vm.caEmitterLayer.emitterSize)
            }

            /// Emitter Cell Attribute Multipliers
            Group {
                FractionNumField(keyPath: \CAEmitterLayer.scale, value: $vm.caEmitterLayer.scale)
                UIntNumField(keyPath: \CAEmitterLayer.seed, value: $vm.caEmitterLayer.seed)
                FractionNumField(keyPath: \CAEmitterLayer.spin, value: $vm.caEmitterLayer.spin)
                FractionNumField(keyPath: \CAEmitterLayer.velocity, value: $vm.caEmitterLayer.velocity)
                FractionNumField(keyPath: \CAEmitterLayer.birthRate, value: $vm.caEmitterLayer.birthRate)
                CasePicker(keyPath: \CAEmitterLayer.emitterMode, selection: $vm.caEmitterLayer.emitterMode)
                FractionNumField(keyPath: \CAEmitterLayer.lifetime, value: $vm.caEmitterLayer.lifetime)
                BoolField(keyPath: \CAEmitterLayer.preservesDepth, value: $vm.caEmitterLayer.preservesDepth)
            }
        }

        Group {
            HStack {
                Text(NSExpression(forKeyPath: \CAEmitterLayer.emitterCells).keyPath)
                Spacer()
                Text("\(vm.caEmitterLayer.emitterCells?.count ?? 0) 个")
            }

            if vm.caEmitterLayer.emitterCells != nil {
                ForEach(Binding($vm.caEmitterLayer.emitterCells)!, id: \.wrappedValue.self) { cell in
                    EmitterCellPanel(cell: cell)
                }
            }
        }
    }
}
