//
//  File.swift
//  File
//
//  Created by JiaChen(: on 1/9/21.
//

#if !canImport(PlaygroundBluetooth)
import Foundation
import CoreBluetooth

extension BluetoothManager: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if centralManager.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: [BLEConstants.UUID_W32_SERVICE], options: nil)
            
            onScan?()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        peripheral.delegate = self
        peripheral.discoverServices([BLEConstants.UUID_W32_SERVICE])
        
        print("Connected to Droid")
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        controlHub = peripheral
        centralManager.connect(controlHub!, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from Droid")
        onDisconnect?()
    }
}
#endif
