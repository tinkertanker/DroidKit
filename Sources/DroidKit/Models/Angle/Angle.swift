//
//  Angle.swift
//  DroidKit
//
//  Created by JiaChen(: on 1/9/21.
//

import Foundation

/// A geometric angle whose value you access in either radians or degrees.
public struct Angle: Hashable, Codable {
    
    /// Zero degrees
    static var zero: Angle = Angle(degrees: 0)
    
    /// The angle, represented in radians
    public var degrees: Double
    
    /// The angle, represented in radians
    public var radians: Double {
        get {
            return degrees / (180 / .pi)
        }
        set {
            self.degrees = newValue * 180 / .pi
        }
    }
    
    public init(radians: Double) {
        self.degrees = radians * 180 / .pi
    }
    
    public init(degrees: Double) {
        self.degrees = degrees
    }
    
    /// Create an Angle with degrees
    public static func degrees(_ degree: Double) -> Angle {
        return Angle(degrees: degree)
    }
    
    /// Create an Angle with radians
    public static func radians(_ radian: Double) -> Angle {
        return Angle(radians: radian)
    }
}

extension Angle: Comparable, Equatable {
    public static func > (lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees > rhs.degrees
    }
    
    public static func ~= (lhs: Angle, rhs: ClosedRange<Angle>) -> Bool {
        return rhs.contains(lhs)
    }
    
    public static func < (lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees < rhs.degrees
    }
    
    public static func >= (lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees >= rhs.degrees
    }
    
    public static func <= (lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees <= rhs.degrees
    }
    
    public static func == (lhs: Angle, rhs: Angle) -> Bool {
        return Double(lhs.degrees) == Double(rhs.degrees)
    }
    
    public static func + (lhs: Angle, rhs: Angle) -> Angle {
        return Angle(degrees:lhs.degrees + rhs.degrees)
    }
    
    public static func += (lhs: inout Angle, rhs: Angle) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: Angle, rhs: Angle) -> Angle {
        return Angle(degrees: lhs.degrees - rhs.degrees)
    }
    
    public static func -= (lhs: inout Angle, rhs: Angle) {
        lhs = lhs - rhs
    }
    
    public static func * (lhs: Angle, rhs: Angle) -> Angle {
        return Angle(degrees: lhs.degrees * rhs.degrees)
    }
    
    public static func *= (lhs: inout Angle, rhs: Angle) {
        lhs = lhs * rhs
    }
    
    public static func / (lhs: Angle, rhs: Angle) -> Angle {
        return Angle(degrees: lhs.degrees / rhs.degrees)
    }
    
    public static func /= (lhs: inout Angle, rhs: Angle) {
        lhs = lhs / rhs
    }
}

extension Angle: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        "\(degrees)°"
    }
    
    public var debugDescription: String {
        "Angle: \(degrees)° / \(radians)rad"
    }
}
