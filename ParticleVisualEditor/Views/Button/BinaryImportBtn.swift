//
//  BinaryImportBtn.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/28.
//

import SwiftUI

struct BinaryImportBtn: View {
    @EnvironmentObject var vm: ParticlePreviewVM

    @State private var isImporting = false

    var body: some View {
        Button {
            isImporting = true
        } label: {
            Text("加载")
        }
        .buttonStyle(BorderedButtonStyle())
        .fileImporter(isPresented: $isImporting, allowedContentTypes: [.data]) { result in
            do {
                let fileUrl = try result.get()
                print(fileUrl)

                guard fileUrl.startAccessingSecurityScopedResource() else { return }
                if let data = try? Data(contentsOf: fileUrl),
                   let obj = try NSKeyedUnarchiver.unarchivedObject(ofClass: CAEmitterLayer.self, from: data) {
                    print(obj.debugDescription)

                    vm.caEmitterLayer = obj
                }
                fileUrl.stopAccessingSecurityScopedResource()
            } catch {
                print("读取文件失败")
                print(error.localizedDescription)
            }
        }
    }
}
