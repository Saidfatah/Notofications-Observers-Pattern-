//
//  SideSelectionViewController.swift
//  observer & notification pattern
//
//  Created by said fatah on 5/4/2022.
//

import UIKit

class SideSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }
    
    @IBAction func onRebelChoicetap(_ sender: Any) {
        let name = Notification.Name(rawValue: lightNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func onImperialChoiceTap(_ sender: Any) {
        let name = Notification.Name(rawValue: darkNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true)
    }
    

}
