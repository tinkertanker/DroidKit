//
//  File.swift
//  File
//
//  Created by JiaChen(: on 1/9/21.
//

#if !canImport(PlaygroundBluetooth)
import Foundation
import CoreBluetooth

class BluetoothManager: NSObject {
    var onConnect: (() -> Void)?
    var onDisconnect: (() -> Void)?
    var onScan: (() -> Void)?
    
    
    internal var centralManager: CBCentralManager!
    
    internal var bitSnapCharacteristics: CBCharacteristic?
    internal var boardControlCharacteristics: CBCharacteristic?
    internal var controlHub: CBPeripheral?
    
    var droidInput: DroidInput!
    
    func search() {
        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue(label: "sg.tk.droid.ble", qos: .userInitiated))
        
        centralManager.delegate = self
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { [self] _ in
            sendCommand(id: 12, payload: [])
        }
    }
}
#endif
