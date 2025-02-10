//
//  EmitterCellImageBtn.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/28.
//

import SwiftUI

struct EmitterCellImageBtn: View {
    @EnvironmentObject var vm: ParticlePreviewVM
    @Binding var cell: CAEmitterCell

    @State var cgImage: CGImage?

    @State private var isImporting = false

    var body: some View {
        Group {
            Color.clear
                .aspectRatio(1, contentMode: .fill)
                .overlay(alignment: .center) {
                    Button {
                        isImporting = true
                    } label: {
                        if cgImage == nil {
                            Image(systemName: "photo.badge.plus.fill")
                                .font(.largeTitle)
                        } else {
                            Image(cgImage!, scale: 1, label: Text("选择图片"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .clipped()
        }
        .onAppear {
            if let contents = cell.contents {
                switch contents {
                case let contents as CGImage:
                    self.cgImage = contents
                default:
                    self.cgImage = nil
                    print("cell.contents 不是 CGImage")
                }
            }
        }
        .fileImporter(isPresented: $isImporting, allowedContentTypes: [.image]) { result in
            do {
                let fileUrl = try result.get()
                print(fileUrl)

                guard fileUrl.startAccessingSecurityScopedResource() else { return }
                if let imageData = try? Data(contentsOf: fileUrl),
                   let image = UIImage(data: imageData) {
                    cell.contents = image.cgImage
                    self.cgImage = image.cgImage
                    vm.reRenderUIView()
                }
                fileUrl.stopAccessingSecurityScopedResource()
            } catch {
                print("error reading")
                print(error.localizedDescription)
            }
        }
    }
}
