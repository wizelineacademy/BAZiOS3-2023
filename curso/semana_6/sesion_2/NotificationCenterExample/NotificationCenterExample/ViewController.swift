//
//  ViewController.swift
//  NotificationCenterExample
//
//  Created by Benny Reyes on 27/02/23.
//

import UIKit

extension Notification.Name {
    static let didRecieveValue = Notification.Name(rawValue: "didReceiveValue")
}

final class ViewController: UIViewController {
    @IBOutlet weak var lblCounter:UILabel!
    var counter = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: Suscribe to your notification
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveValue), name: .didRecieveValue, object: nil)
        lblCounter.text = "\(counter)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // TODO: Remember remove your observer
    }
    
    // TODO: Do any modifications to receive your value
    @objc func didReceiveValue(_ notification: NSNotification){
        guard let message = notification.userInfo, let value:Int = message["value"] as? Int else {
            return
        }
        counter = counter + value
        lblCounter.text = "\(counter)"
    }

    @IBAction func showCounter(){
        if navigationController?.topViewController == self{
            let controller = CounterViewController(nibName: "CounterViewController", bundle: Bundle.main)
            controller.modalPresentationStyle = .pageSheet
            present(controller, animated: true)
        }
    }

}

