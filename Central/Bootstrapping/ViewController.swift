//
//  ViewController.swift
//  Bootstrapping
//
//  Created by Adonis Gaitatzis on 11/15/16.
//  Copyright © 2016 Adonis Gaitatzis. All rights reserved.
//
// Based on this: https://stackoverflow.com/questions/32287313/corebluetooth-xcode
// installing CareBluetooth.Framework: https://stackoverflow.com/questions/20025142/how-do-i-get-find-corebluetooth-framework
//

import UIKit
import CoreBluetooth

/**
 This view attempts to turn on the Bluetooth Radio
 */
class ViewController: UIViewController, CBCentralManagerDelegate {
    
    // MARK: UI Elements
    @IBOutlet weak var bluetoothStatusLabel: UILabel!
    
    
    // MARK: Scan Properties
    var centralManager:CBCentralManager!
    
    
    
    /**
     View loaded.  Start Bluetooth radio.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Initializing central manager")
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    // MARK:  CBCentralManagerDelegate Functions
    
    
    /**
     Bluetooth radio state changed
     
     - Parameters:
     - central: the reference to the central
     */
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Central Manager updated: checking state")
        
        switch (central.state) {
        case .poweredOff:
            print ("BLE Hardware is powered off")
            bluetoothStatusLabel.text = "Bluetooth Radio Off"
        case .poweredOn:
            print ("BLE Hardware powered on and ready")
            bluetoothStatusLabel.text = "Bluetooth Radio On"
        case .resetting:
            print ("BLE Hardware is resetting...")
            bluetoothStatusLabel.text = "Bluetooth Radio Resetting..."
        case .unauthorized:
            print ("BLE State is unauthorized")
            bluetoothStatusLabel.text = "Bluetooth Radio Unauthorized"
        case .unsupported:
            print ("Ble hardware is unsupported on this device")
            bluetoothStatusLabel.text = "Bluetooth Radio Unsupported"
        case .unknown:
            print ("Ble state is unavailable")
            bluetoothStatusLabel.text = "Bluetooth State Unknown"
        }
    }

}

