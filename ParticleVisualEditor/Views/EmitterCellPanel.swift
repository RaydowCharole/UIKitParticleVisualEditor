//
//  EmitterCellPanel.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/27.
//

import SwiftUI

struct EmitterCellPanel: View {
    @EnvironmentObject var vm: ParticlePreviewVM
    @Binding var cell: CAEmitterCell
    @State var isExpanded = true

    var index: Int {
        vm.caEmitterLayer.emitterCells?.firstIndex(of: cell) ?? -1
    }

    var body: some View {
        HStack {
            PanelTitle("NO.\(index + 1) CAEmitterCell")

            Button {
                vm.caEmitterLayer.emitterCells?.removeAll(where: {
                    $0 == cell
                })
                vm.reRenderSwiftUIView()
            } label: {
                Image(systemName: "trash.circle")
            }
            .buttonStyle(BorderedButtonStyle())

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
            /// Providing Emitter Cell Content
            EmitterCellImageBtn(cell: $cell)
            CGRectField(keyPath: \CAEmitterCell.contentsRect, rect: $cell.contentsRect)
            // TODO: emitterCells

            
            /// Setting Emitter Cell Visual Attributes
            Group {
                BoolField(keyPath: \CAEmitterCell.isEnabled, value: $cell.isEnabled)                
                OptionalColorField(keyPath: \CAEmitterCell.color, value: $cell.color)
                FractionNumField(keyPath: \CAEmitterCell.redRange, value: $cell.redRange)
                FractionNumField(keyPath: \CAEmitterCell.greenRange, value: $cell.greenRange)
                FractionNumField(keyPath: \CAEmitterCell.blueRange, value: $cell.blueRange)
                FractionNumField(keyPath: \CAEmitterCell.alphaRange, value: $cell.alphaRange)
                FractionNumField(keyPath: \CAEmitterCell.redSpeed, value: $cell.redSpeed)
                FractionNumField(keyPath: \CAEmitterCell.greenSpeed, value: $cell.greenSpeed)
                FractionNumField(keyPath: \CAEmitterCell.blueSpeed, value: $cell.blueSpeed)
                FractionNumField(keyPath: \CAEmitterCell.alphaSpeed, value: $cell.alphaSpeed)
                StrCasePicker(keyPath: \CAEmitterCell.magnificationFilter, selection: $cell.magnificationFilter, selections: CALayerContentsFilter.allCases)
                StrCasePicker(keyPath: \CAEmitterCell.minificationFilter, selection: $cell.minificationFilter, selections: CALayerContentsFilter.allCases)
                FractionNumField(keyPath: \CAEmitterCell.minificationFilterBias, value: $cell.minificationFilterBias)
                FractionNumField(keyPath: \CAEmitterCell.scale, value: $cell.scale)
                FractionNumField(keyPath: \CAEmitterCell.scaleRange, value: $cell.scaleRange)
                FractionNumField(keyPath: \CAEmitterCell.contentsScale, value: $cell.contentsScale)
                OptionalStrField(keyPath: \CAEmitterCell.name, value: $cell.name)
                // TODO: style
            }

            /// Setting Emitter Cell Motion Attributes
            Group {
                FractionNumField(keyPath: \CAEmitterCell.spin, value: $cell.spin)
                FractionNumField(keyPath: \CAEmitterCell.spinRange, value: $cell.spinRange)
                FractionNumField(keyPath: \CAEmitterCell.emissionLatitude, value: $cell.emissionLatitude)
                FractionNumField(keyPath: \CAEmitterCell.emissionLongitude, value: $cell.emissionLongitude)
                FractionNumField(keyPath: \CAEmitterCell.emissionRange, value: $cell.emissionRange)
            }

            /// Setting Emitter Cell Temporal Attributes
            Group {
                FractionNumField(keyPath: \CAEmitterCell.lifetime, value: $cell.lifetime)
                FractionNumField(keyPath: \CAEmitterCell.lifetimeRange, value: $cell.lifetimeRange)
                FractionNumField(keyPath: \CAEmitterCell.birthRate, value: $cell.birthRate)
                FractionNumField(keyPath: \CAEmitterCell.scaleSpeed, value: $cell.scaleSpeed)
                FractionNumField(keyPath: \CAEmitterCell.velocity, value: $cell.velocity)
                FractionNumField(keyPath: \CAEmitterCell.velocityRange, value: $cell.velocityRange)
                FractionNumField(keyPath: \CAEmitterCell.xAcceleration, value: $cell.xAcceleration)
                FractionNumField(keyPath: \CAEmitterCell.yAcceleration, value: $cell.yAcceleration)
                FractionNumField(keyPath: \CAEmitterCell.zAcceleration, value: $cell.zAcceleration)
            }
        }
    }
}
