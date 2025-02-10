//
//  ParticlePreview.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/21.
//

import SwiftUI

struct ParticlePreview: UIViewControllerRepresentable {
    typealias UIViewControllerType = ParticlePreviewVC

    @EnvironmentObject var vm: ParticlePreviewVM

    func makeUIViewController(context: Context) -> UIViewControllerType {
        print("makeUIViewController")

        return ParticlePreviewVC(layer: vm.caEmitterLayer)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("updateUIViewController")

        uiViewController.replaceLayer(vm.caEmitterLayer)

        vm.reRenderUIView()
    }

    func reRender() {
        let saved = vm.caEmitterLayer.birthRate
        vm.caEmitterLayer.birthRate = 0
        vm.caEmitterLayer.birthRate = saved
    }
}
