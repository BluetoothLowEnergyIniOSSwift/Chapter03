//
//  BlePeripheral.swift
//  sketch
//
//  Created by Adonis Gaitatzis on 1/9/17.
//  Copyright © 2017 Adonis Gaitatzis. All rights reserved.
//

import UIKit
import CoreBluetooth


class BlePeripheral : NSObject, CBPeripheralManagerDelegate {
    
    // MARK: Peripheral State
    
    // Peripheral Manager
    var peripheralManager:CBPeripheralManager!
    
    // Connected Central
    var central:CBCentral!
    
    // delegate
    var delegate:BlePeripheralDelegate!
    
    /**
     Initialize BlePeripheral with a corresponding Peripheral
     
     - Parameters:
     - delegate: The BlePeripheralDelegate
     - peripheral: The discovered Peripheral
     */
    init(delegate: BlePeripheralDelegate?) {
        super.init()
        
        // empty dispatch queue
        let dispatchQueue:DispatchQueue! = nil
        self.delegate = delegate
        
        peripheralManager = CBPeripheralManager(delegate: self, queue: dispatchQueue)
    }
    
    // MARK: CBPeripheralManagerDelegate
    
    /**
     Peripheral will become active
     */
    func peripheralManager(_ peripheral: CBPeripheralManager, willRestoreState dict: [String : Any]) {
        print("restoring peripheral state")
    }
    
    /**
     Bluetooth Radio state changed
     */
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        peripheralManager = peripheral
        delegate?.blePeripheral?(stateChanged: peripheral.state)
        
    }
}
