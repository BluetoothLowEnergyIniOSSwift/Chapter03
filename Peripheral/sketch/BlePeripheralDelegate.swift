//
//  BlePeripheralDelegate.swift
//  sketch
//
//  Created by Adonis Gaitatzis on 1/9/17.
//  Copyright © 2017 Adonis Gaitatzis. All rights reserved.
//

import UIKit
import CoreBluetooth


/**
 BlePeripheralDelegate relays important status changes from BlePeripheral
 */
@objc protocol BlePeripheralDelegate : class {
    
    /**
     Bluetooth Radio state changed
     
     - Parameters:
     - state: new CBManagerState
     */
    @objc optional func blePeripheral(stateChanged state: CBManagerState)
    
}
