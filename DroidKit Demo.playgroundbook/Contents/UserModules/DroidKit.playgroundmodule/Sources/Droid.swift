//
//  Droid.swift
//  DroidKit
//
//  Created by JiaChen(: on 1/9/21.
//

import Foundation
#if canImport(UIKit)
import UIKit.UIColor
#endif
import CoreBluetooth

public class Droid {
    private let bluetoothManager = BluetoothManager()
    
    public let input = DroidInput()
    
    public init() {
        bluetoothManager.droidInput = input
        bluetoothManager.search()
    }
    
    public enum VerticalDirection {
        case forward, backward
    }
    
    public enum HorizontalDirection {
        case left, right
    }
    
    public struct Components: OptionSet {
        public let rawValue: Int
        
        public static let led = Components(rawValue: 1)
        public static let servo = Components(rawValue: 2)
        public static let motor = Components(rawValue: 3)
        
        public static let all: Components = [.led, .servo, .motor]
        public static let movement: Components = [.servo, .motor]
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
    
    /// Move the bot in a certain direction at a particular speed
    /// - Parameters:
    ///   - direction: Direction to move the droid in.
    ///   - speed: Speed to move the droid, 0 to 1.
    public func move(_ direction: VerticalDirection = .forward, atSpeed speed: Double = 0.5) {
        guard 0 ... 1 ~= speed else { return }
        let convertedSpeed = round(128 * speed)
        
        switch direction {
        case .forward:
            let motorMovement = UInt8(127 + convertedSpeed)
            sendCommand(id: 10, payload: [2, motorMovement])
        case .backward:
            let motorMovement = UInt8(128 - convertedSpeed)
            sendCommand(id: 10, payload: [2, motorMovement])
        }
    }
    
    /// Stop the Droid
    /// - Parameters:
    ///   - components: The components on the Droid to stop. By default, it stops all movement (the servo and motor).
    public func stop(_ components: Components = .movement) {
        if components.contains(.motor) {
            sendCommand(id: 10, payload: [2, 128])
        }
        if components.contains(.servo) {
            sendCommand(id: 10, payload: [1, 128])
        }
        if components.contains(.led) {
            changeLEDColor(toRed: 0, green: 0, blue: 0)
        }
    }
    
    public func turnWheel(by angle: Angle) {
        guard angle ~= .degrees(0) ... .degrees(180) else { return }
        let servoTurn = round(angle.degrees / 180 * 255)
        sendCommand(id: 10, payload: [1, UInt8(servoTurn)])
    }
    
    public func turnWheel(_ direction: HorizontalDirection, by angle: Angle) {
        guard angle ~= .degrees(0) ... .degrees(90) else { return }
        turnWheel(by: direction == .right ? angle : .degrees(180) - angle)
    }
    
    public func wait(for seconds: TimeInterval) {
        Thread.sleep(forTimeInterval: seconds)
    }
    
    public func wait(for duration: Duration) {
        wait(for: duration.seconds)
    }
    
    #if canImport(UIKit)
    public func changeLEDColor(to color: UIColor) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        red *= 255
        green *= 255
        blue *= 255
        
        changeLEDColor(toRed: UInt8(red), green: UInt8(green), blue: UInt8(blue))
    }
    #endif
    
    public func changeLEDColor(to hexString: String) {
        var hex = hexString.lowercased()
        if hex.hasPrefix("#") { hex.remove(at: hex.startIndex) }
        
        guard hex.count == 6, hex.allSatisfy({ $0.isHexDigit }) else { return }
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            let r = UInt8((hexNumber & 0xff0000) >> 16)
            let g = UInt8((hexNumber & 0x00ff00) >> 8)
            let b = UInt8((hexNumber & 0x0000ff))
            
            changeLEDColor(toRed: r, green: g, blue: b)
        }
    }
    
    enum SoundEffect: Int {
        case search = 0
        case warning = 1
        case unknown = 2
        case target = 3
        case wave = 4
    }
    
    public func playSound(_ sound: UInt8) {
        sendCommand(id: 15, payload: [sound])
    }
    
    public func changeLEDColor(toRed red: UInt8, green: UInt8, blue: UInt8) {
        let colors = [red, green, blue]
        sendCommand(id: 9, payload: colors)
    }
    
    public func onConnect(action: @escaping (() -> Void)) {
        bluetoothManager.onConnect = action
    }
    
    public func onDisconnect(action: @escaping (() -> Void)) {
        bluetoothManager.onDisconnect = action
    }
    
    public func onScan(action: @escaping (() -> Void)) {
        bluetoothManager.onScan = action
    }
    
    private func sendCommand(id: UInt8, payload: [UInt8]) {
        bluetoothManager.sendCommand(id: id, payload: payload)
    }
}
