//
//  ParticlePreviewVM.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/24.
//

import SwiftUI

@MainActor
class ParticlePreviewVM: ObservableObject {
    @Published var caEmitterLayer: CAEmitterLayer

    init() {
        caEmitterLayer = CAEmitterLayer()
        caEmitterLayer.renderMode = .oldestFirst

        #if DEBUG
            let cell = CAEmitterCell()
            cell.birthRate = 2
            cell.lifetime = 5
            cell.velocity = 100
            cell.contents = UIImage(named: "apple")?.cgImage
            caEmitterLayer.emitterCells = [cell]
        #endif
    }

    func reRenderUIView() {
        let oldValue = caEmitterLayer.birthRate
        caEmitterLayer.birthRate = 0
        caEmitterLayer.birthRate = oldValue
    }

    func reRenderSwiftUIView() {
        objectWillChange.send()
    }
}
