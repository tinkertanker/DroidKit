//
//  PlaygroundBluetoothManager+PlaygroundBluetoothCentralManagerDelegate.swift
//  DroidKit
//
//  Created by JiaChen(: on 1/9/21.
//

#if canImport(PlaygroundBluetooth)
import PlaygroundBluetooth
import CoreBluetooth

extension BluetoothManager: PlaygroundBluetoothCentralManagerDelegate {
    func centralManagerStateDidChange(_ centralManager: PlaygroundBluetoothCentralManager) {
        if centralManager.state == .poweredOn {
            centralManager.scanning = true
            print("Scanning for Droid")
            onScan?()
        }
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didConnectTo peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([BLEConstants.UUID_W32_SERVICE])
        print("Connected to Droid")
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDiscover peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) {
        controlHub = peripheral
        centralManager.connect(to: controlHub!)
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDisconnectFrom peripheral: CBPeripheral, error: Error?) {
        print("Disconnected from Droid")
        onDisconnect?()
    }
}
#endif
