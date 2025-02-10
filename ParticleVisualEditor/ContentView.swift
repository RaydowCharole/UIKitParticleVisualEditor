//
//  ContentView.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ParticlePreviewVM()

    var body: some View {
        HStack(spacing: 0) {
            ScrollView {
                VStack {
                    EmitterLayerPanel()
                        .padding(.horizontal)

                    Button {
                        withAnimation {
                            let newCell = CAEmitterCell()
                            newCell.birthRate = 2
                            newCell.lifetime = 5
                            newCell.velocity = 100
                            if vm.caEmitterLayer.emitterCells == nil {
                                vm.caEmitterLayer.emitterCells = [newCell]
                            } else {
                                vm.caEmitterLayer.emitterCells!.append(newCell)
                            }
                            vm.reRenderSwiftUIView()
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .font(.title)
                    .buttonStyle(BorderedButtonStyle())
                }
                .padding(.vertical)
                .frame(width: 330)
            }

            ZStack(alignment: .bottom) {
                ParticlePreview()
                    .clipped()
                    .background(Color.gray)

                HStack {
                    VStack(alignment: .leading) {
                        Text("二进制文件")
                            .foregroundColor(.black)
                        HStack {
                            BinaryImportBtn()
                            BinaryExportBtn()
                            BinaryUsageCopyBtn()
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(8)
                    .padding()

                    VStack(alignment: .leading) {
                        Text("高级语言代码")
                            .foregroundColor(.black)
                        HStack {
                            GenCodeInspectBtn()
                            GenCodeCopyBtn()
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(8)
                    .padding()
                }
            }
        }
        .hideKeyboard()
        .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
