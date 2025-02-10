//
//  BinaryUsageCopyBtn.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/8/16.
//

import SwiftUI

struct BinaryUsageCopyBtn: View {
    let swiftCode = """
    let fileName = "二进制文件名"
    let caEmitterLayer = try? NSKeyedUnarchiver.unarchivedObject(ofClass: CAEmitterLayer.self, from: NSData(contentsOfFile: Bundle.main.path(forResource: fileName, ofType: nil)!) as Data)
    """

    let ocCode = """
    NSString *fileName = @"二进制文件名";
    CAEmitterLayer *caEmitterLayer = [NSKeyedUnarchiver unarchivedObjectOfClass:[CAEmitterLayer class] fromData:[NSData dataWithContentsOfFile:[NSBundle.mainBundle pathForResource:fileName ofType:nil]] error:nil];
    """

    var body: some View {
        Group {
            Button {
                UIPasteboard.general.string = swiftCode
            } label: {
                Text("复制使用代码Swift")
            }

            Button {
                UIPasteboard.general.string = ocCode
            } label: {
                Text("复制使用代码OC")
            }
        }
        .buttonStyle(BorderedButtonStyle())
    }
}
