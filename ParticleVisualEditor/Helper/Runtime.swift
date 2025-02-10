//
//  Runtime.swift
//  ParticleVisualEditor
//
//  Created by Raydow on 2024/9/8.
//

import Foundation

func classIvarNames(_ type: AnyClass) -> [String] {
    var count: UInt32 = 0
    let list = class_copyIvarList(type, &count)
    var names = [String]()
    names.reserveCapacity(Int(count))
    if let list = list {
        for i in 0 ..< count {
            let ivar = list[Int(i)]
            if let cname = ivar_getName(ivar),
               let name = String(utf8String: cname) {
                names.append(name)
            }
        }
    }
    free(list)
    return names
}

func classPropertyNames(_ type: AnyClass) -> [String] {
    var count: UInt32 = 0
    let list = class_copyPropertyList(type, &count)
    var names = [String]()
    names.reserveCapacity(Int(count))
    if let list = list {
        for i in 0 ..< count {
            let property = list[Int(i)]
            let cname = property_getName(property)
            if let name = String(utf8String: cname) {
                names.append(name)
            }
        }
    }
    free(list)
    return names
}

func classMethodNames(_ type: AnyClass) -> [String] {
    var count: UInt32 = 0
    let list = class_copyMethodList(type, &count)
    var names = [String]()
    names.reserveCapacity(Int(count))
    if let list = list {
        for i in 0 ..< count {
            let method = list[Int(i)]
            let selector = method_getName(method)
            let name = NSStringFromSelector(selector)
            names.append(name)
        }
    }
    free(list)
    return names
}

func classProtocolNames(_ type: AnyClass) -> [String] {
    var count: UInt32 = 0
    let list = class_copyProtocolList(type, &count)
    var names = [String]()
    names.reserveCapacity(Int(count))
    if let list = list {
        for i in 0 ..< count {
            let ivar = list[Int(i)]
            let cname = protocol_getName(ivar)
            if let name = String(utf8String: cname) {
                names.append(name)
            }
        }
    }
    return names
}
