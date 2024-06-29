//
//  Math.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public enum Math {
    static var pi = Double.pi
    static var e = Double(M_E)
    static var tau = Double.pi * 2
    static var inf = Double.infinity
    static var nan = Double.nan

    static func sqrt(_ value: Double) -> Double {
        Foundation.sqrt(value)
    }

    static func factorial(_ value: Int) -> Int {
        value == 0 ? 1 : value * factorial(value - 1)
    }

    static func radians(_ degrees: Double) -> Double {
        degrees * pi / 180
    }

    static func degrees(_ radians: Double) -> Double {
        radians * 180 / pi
    }

    static func sin(_ degrees: Double) -> Double {
        Foundation.sin(radians(degrees))
    }

    static func cos(_ degrees: Double) -> Double {
        Foundation.cos(radians(degrees))
    }

    static func tan(_ degrees: Double) -> Double {
        Foundation.tan(radians(degrees))
    }

    static func asin(_ value: Double) -> Double {
        Foundation.asin(value)
    }

    static func acos(_ value: Double) -> Double {
        Foundation.acos(value)
    }

    static func atan(_ value: Double) -> Double {
        Foundation.atan(value)
    }

    static func atan2(_ y: Double, _ x: Double) -> Double {
        Foundation.atan2(y, x)
    }

    static func sinh(_ degrees: Double) -> Double {
        Foundation.sinh(radians(degrees))
    }

    static func cosh(_ degrees: Double) -> Double {
        Foundation.cosh(radians(degrees))
    }

    static func tanh(_ degrees: Double) -> Double {
        Foundation.tanh(radians(degrees))
    }

    static func asinh(_ value: Double) -> Double {
        Foundation.asinh(value)
    }

    static func acosh(_ value: Double) -> Double {
        Foundation.acosh(value)
    }

    static func atanh(_ value: Double) -> Double {
        Foundation.atanh(value)
    }

    static func pow(_ base: Double, _ exponent: Double) -> Double {
        Foundation.pow(base, exponent)
    }

    static func log(_ value: Double) -> Double {
        Foundation.log(value)
    }

    static func log10(_ value: Double) -> Double {
        Foundation.log10(value)
    }

    static func log2(_ value: Double) -> Double {
        Foundation.log2(value)
    }

    static func exp(_ value: Double) -> Double {
        Foundation.exp(value)
    }
}
