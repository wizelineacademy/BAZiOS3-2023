//
//  CounterViewController.swift
//  NotificationCenterExample
//
//  Created by Benny Reyes on 27/02/23.
//

import UIKit

// This will show two buttons to set a value though Notification Center
final class CounterViewController: UIViewController {

    @IBAction func didClickRestButton(){
        setValueToCounter(value: -1)
    }
    
    @IBAction func didClickAddButton(){
        setValueToCounter(value: 1)
    }
    
    func setValueToCounter(value: Int){
        // TODO: Set notification to the userInfo key "value"
        
    }

}
