//
//  GenCodeCopyBtn.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/9.
//

import SwiftUI

struct GenCodeCopyBtn: View {
    @EnvironmentObject var vm: ParticlePreviewVM

    var body: some View {
        Button {
            UIPasteboard.general.string = vm.caEmitterLayer.genCode
        } label: {
            Text("复制代码")
        }
        .buttonStyle(BorderedButtonStyle())
    }
}
