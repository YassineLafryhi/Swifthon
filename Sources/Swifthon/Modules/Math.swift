//
//  Math.swift
//
//
//  Created by Yassine Lafryhi on 29/6/2024.
//

import Foundation

public enum Math {
    public static var pi = Double.pi
    public static var e = Double(M_E)
    public static var tau = Double.pi * 2
    public static var inf = Double.infinity
    public static var nan = Double.nan

    public static func sqrt(_ value: Double) -> Double {
        Foundation.sqrt(value)
    }

    public static func factorial(_ value: Int) -> Int {
        value == 0 ? 1 : value * factorial(value - 1)
    }

    public static func radians(_ degrees: Double) -> Double {
        degrees * pi / 180
    }

    public static func degrees(_ radians: Double) -> Double {
        radians * 180 / pi
    }

    public static func sin(_ degrees: Double) -> Double {
        Foundation.sin(radians(degrees))
    }

    public static func cos(_ degrees: Double) -> Double {
        Foundation.cos(radians(degrees))
    }

    public static func tan(_ degrees: Double) -> Double {
        Foundation.tan(radians(degrees))
    }

    public static func asin(_ value: Double) -> Double {
        Foundation.asin(value)
    }

    public static func acos(_ value: Double) -> Double {
        Foundation.acos(value)
    }

    public static func atan(_ value: Double) -> Double {
        Foundation.atan(value)
    }

    public static func atan2(_ y: Double, _ x: Double) -> Double {
        Foundation.atan2(y, x)
    }

    public static func sinh(_ degrees: Double) -> Double {
        Foundation.sinh(radians(degrees))
    }

    public static func cosh(_ degrees: Double) -> Double {
        Foundation.cosh(radians(degrees))
    }

    public static func tanh(_ degrees: Double) -> Double {
        Foundation.tanh(radians(degrees))
    }

    public static func asinh(_ value: Double) -> Double {
        Foundation.asinh(value)
    }

    public static func acosh(_ value: Double) -> Double {
        Foundation.acosh(value)
    }

    public static func atanh(_ value: Double) -> Double {
        Foundation.atanh(value)
    }

    public static func pow(_ base: Double, _ exponent: Double) -> Double {
        Foundation.pow(base, exponent)
    }

    public static func log(_ value: Double) -> Double {
        Foundation.log(value)
    }

    public static func log10(_ value: Double) -> Double {
        Foundation.log10(value)
    }

    public static func log2(_ value: Double) -> Double {
        Foundation.log2(value)
    }

    public static func exp(_ value: Double) -> Double {
        Foundation.exp(value)
    }
}
