//
//  ViewController.swift
//  sketch
//
//  Created by Adonis Gaitatzis on 1/9/17.
//  Copyright © 2017 Adonis Gaitatzis. All rights reserved.
//

import UIKit
import CoreBluetooth


/**
 This view displays the state of a BlePeripheral
 */
class ViewController: UIViewController, BlePeripheralDelegate {
    
    // MARK: UI Elements
    @IBOutlet weak var advertisingLabel: UILabel!
    
    // MARK: BlePeripheral
    
    // BlePeripheral
    var blePeripheral:BlePeripheral!
    
    /**
     UIView loaded
     */
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    /**
     View appeared.  Start the Peripheral
     */
    override func viewDidAppear(_ animated: Bool) {
        blePeripheral = BlePeripheral(delegate: self)
    }
    
    // MARK: BlePeripheralDelegate

    /**
     Bluetooth radio state changed
     
     - Parameters:
     - state: the CBManagerState
     */
    func blePeripheral(stateChanged state: CBManagerState) {
        switch (state) {
        case CBManagerState.poweredOn:
            print("Bluetooth on")
        case CBManagerState.poweredOff:
            print("Bluetooth off")
        default:
            print("Bluetooth not ready yet...")
        }
    }
}

