//
//  GenCodeInspectBtn.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/9.
//

import SwiftUI

struct GenCodeInspectBtn: View {
    @EnvironmentObject var vm: ParticlePreviewVM
    @State private var isShowing = false

    var body: some View {
        Button {
            isShowing = true
        } label: {
            Text("查看代码")
        }
        .buttonStyle(BorderedButtonStyle())
        .sheet(isPresented: $isShowing) {
            VStack {
                ScrollView {
                    Text(vm.caEmitterLayer.genCode)
                }

                HStack {
                    Spacer()

                    Button {
                        isShowing = false
                    } label: {
                        Text("OK")
                    }

                    Spacer()

                    GenCodeCopyBtn()

                    Spacer()
                }
                .font(.title3)
                .buttonStyle(BorderedButtonStyle())
            }
            .padding()
        }
    }
}
