//
//  BinaryExportBtn.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/6/28.
//

import SwiftUI
import UniformTypeIdentifiers

struct BinaryExportBtn: View {
    @EnvironmentObject var vm: ParticlePreviewVM

    @State var isExporting = false

    var body: some View {
        Button {
            isExporting = true
        } label: {
            Text("导出")
        }
        .buttonStyle(BorderedButtonStyle())
        .fileExporter(isPresented: $isExporting, document: BinaryDocument(vm.caEmitterLayer), contentType: .data) { result in
            if case .success = result {
                print("导出二进制成功")
            } else {
                print("导出二进制失败")
            }
        }
    }
}

struct BinaryDocument: FileDocument {
    static var readableContentTypes: [UTType] = [.data]

    let obj: CAEmitterLayer

    init(_ obj: CAEmitterLayer) {
        self.obj = obj
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let obj = CAEmitterLayer(coder: try NSKeyedUnarchiver(forReadingFrom: data))
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.obj = obj
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = try NSKeyedArchiver.archivedData(withRootObject: obj, requiringSecureCoding: true)

        return FileWrapper(regularFileWithContents: data)
    }
}
