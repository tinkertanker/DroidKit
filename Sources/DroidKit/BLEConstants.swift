//
//  BLEConstants.swift
//  DroidKit
//
//  Created by JiaChen(: on 1/9/21.
//

import Foundation
import CoreBluetooth

enum BLEConstants {
    static let W32_AUDIO_UPLOAD_CHARACTERISTIC = CBUUID(string: "d9d9e9e3-aa4e-4797-8151-cb41cedaf2ad")
    static let W32_BITSNAP_CHARACTERISTIC = CBUUID(string: "d9d9e9e1-aa4e-4797-8151-cb41cedaf2ad")
    static let W32_BOARD_CONTROL_CHARACTERISTIC = CBUUID(string: "d9d9e9e2-aa4e-4797-8151-cb41cedaf2ad")
    static let CLIENT_CHARACTERISTIC_CONFIG = CBUUID(string: "00002902-0000-1000-8000-00805f9b34fb")
    static let UUID_W32_SERVICE = CBUUID(string: "d9d9e9e0-aa4e-4797-8151-cb41cedaf2ad")
}
