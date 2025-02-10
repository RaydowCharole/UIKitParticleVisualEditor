//
//  CAEmitter+GenCode.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/6.
//

import UIKit

fileprivate func combine(varName: String, andValue value: Any) -> String {
    var code = ""
    #if DEBUG
        code += "// \(type(of: value))\n"
    #endif
    if varName.hasSuffix("contents") {
        code += "\(varName) = UIImage(named: \"图片名\")?.cgImage"
    } else if varName.hasSuffix("color") {
        code += "\(varName) = \((value as! CGColor).genCode)"
    } else if "\(type(of: value))" == "NSTaggedPointerString" {
        code += "\(varName) = \"\(value)\""
    } else {
        switch value {
        case let value as [CAEmitterCell]:
            code += "\(varName) = \(value.genCode)"; break
        case let value as CGRect:
            code += "\(varName) = \(value.genCode)"; break
        case let value as NSString:
            code += "\(varName) = \(value.genCode)"; break
        case let value as CGPoint:
            code += "\(varName) = \(value)"; break
        default:
            code += "\(varName) = \(value)"; break
        }
    }
    code += "\n"
    return code
}

extension CAEmitterLayer {
    var genCode: String {
        var code = "let layer = CAEmitterLayer()\n"

        for name in classPropertyNames(Self.self) {
            if let value = value(forKey: name) {
                if shouldArchiveValue(forKey: name) {
                    code += combine(varName: "layer.\(name)", andValue: value)
                } else {
                    // print("should not archive for \(name)")
                }
            }
        }

        return code
    }
}

extension Array<CAEmitterCell> {
    var genCode: String {
        var code = "[\n"
        for value in self {
            code += "{\n"
            code += value.genCode
            code += "return cell\n}(),\n"
        }
        code += "]"
        return code
    }
}

extension CAEmitterCell {
    var genCode: String {
        var code = "let cell = CAEmitterCell()\n"

        for name in classPropertyNames(Self.self) {
            if let value = value(forKey: name) {
                if shouldArchiveValue(forKey: name) {
                    code += combine(varName: "cell.\(name)", andValue: value)
                } else {
                    // print("should not archive for \(name)")
                }
            }
        }

        return code
    }
}

extension CGRect {
    var genCode: String {
        "CGRect(x: \(origin.x), y: \(origin.y), width: \(size.width), height: \(size.height))"
    }
}

extension NSString {
    var genCode: String {
        ".\(self)"
    }
}

extension CGColor {
    var genCode: String {
        let ciColor = CIColor(cgColor: self)
        return "CGColor(red: \(ciColor.red), green: \(ciColor.green), blue: \(ciColor.blue), alpha: \(ciColor.alpha))"
    }
}
