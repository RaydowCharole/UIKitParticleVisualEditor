//
//  ParticlePreviewVC.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/21.
//

import UIKit

class ParticlePreviewVC: UIViewController {
    var emitterLayer: CAEmitterLayer

    init(layer: CAEmitterLayer) {
        emitterLayer = layer

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.addSublayer(emitterLayer)
    }

    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")

        emitterLayer.position = view.center
    }

    func replaceLayer(_ newLayer: CAEmitterLayer) {
        if newLayer != emitterLayer {
            emitterLayer.removeFromSuperlayer()
            emitterLayer = newLayer
            view.layer.addSublayer(newLayer)
        }
    }
}
