//
//  Duration.swift
//  DroidKit
//
//  Created by JiaChen(: on 1/9/21.
//

import Foundation

public struct Duration: Codable {
    public var seconds: TimeInterval
    
    public var minutes: TimeInterval {
        get { seconds / 60 }
        set { seconds = newValue * 60 }
    }
    public var hours: TimeInterval {
        get { seconds / 3600 }
        set { seconds = newValue * 3600 }
    }
    
    public static var zero = Duration(seconds: 0)
    
    public init(seconds: TimeInterval = 0, minutes: TimeInterval = 0, hours: TimeInterval = 0) {
        self.seconds = seconds + minutes * 60 + hours * 3600
    }
    
    public static func seconds(_ seconds: TimeInterval) -> Duration {
        return Duration(seconds: seconds)
    }
    
    public static func minutes(_ minutes: TimeInterval) -> Duration {
        return Duration(minutes: minutes)
    }
    
    public static func hours(_ hours: TimeInterval) -> Duration {
        return Duration(hours: hours)
    }
}

extension Duration: Equatable {
    public static func == (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.seconds == rhs.seconds
    }
}

extension Duration: Comparable {
    public static func > (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.seconds > rhs.seconds
    }
    
    public static func < (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.seconds < rhs.seconds
    }
    
    public static func >= (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.seconds >= rhs.seconds
    }
    
    public static func <= (lhs: Duration, rhs: Duration) -> Bool {
        return lhs.seconds <= rhs.seconds
    }
    
    public static func + (lhs: Duration, rhs: Duration) -> Duration {
        return Duration(seconds: lhs.seconds + rhs.seconds)
    }
    
    public static func += (lhs: inout Duration, rhs: Duration) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: Duration, rhs: Duration) -> Duration {
        return Duration(seconds: lhs.seconds - rhs.seconds)
    }
    
    public static func -= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs - rhs
    }
    
    public static func * (lhs: Duration, rhs: Duration) -> Duration {
        return Duration(seconds: lhs.seconds * rhs.seconds)
    }
    
    public static func *= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs * rhs
    }
    
    public static func / (lhs: Duration, rhs: Duration) -> Duration {
        return Duration(seconds: lhs.seconds / rhs.seconds)
    }
    
    public static func /= (lhs: inout Duration, rhs: Duration) {
        lhs = lhs / rhs
    }
}
