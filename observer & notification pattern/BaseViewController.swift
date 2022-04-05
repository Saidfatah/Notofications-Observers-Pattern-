//
//  ViewController.swift
//  observer & notification pattern
//
//  Created by said fatah on 5/4/2022.
//

import UIKit

let lightNotificationKey = "co.saidfatah.lightSide"
let darkNotificationKey = "co.saidfatah.darkSide"

class BaseViewController: UIViewController {

    @IBOutlet weak var sideLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    let light = Notification.Name(rawValue: lightNotificationKey)
    let dark = Notification.Name(rawValue: darkNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }
    
    /// this is used to creat observers
    /// so that we can implemnt the Notification & Observers Pattern
    func createObservers(){
        // light
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateMainImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateBackgroundColor(notification:)), name: light, object: nil)
    
        // dark
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateMainImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.updateBackgroundColor(notification:)), name: dark, object: nil)

    }
    
    @objc func updateMainImage(notification : NSNotification){
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "luke")! : UIImage(named: "vader")!
        mainImage.image = image
    }
    @objc func updateLabel(notification : NSNotification){
        let isLight = notification.name == light
        let label = isLight ? "Luke Skyewalker" : "Darh Vader"
        sideLabel.text = label
    }
    @objc func updateBackgroundColor(notification : NSNotification){
        let isLight = notification.name == light
        let backgroundColor:UIColor = isLight ? .cyan : .red
        view.backgroundColor = backgroundColor
    }
    
    @IBAction func onChooseButtonTap(_ sender: Any) {
        let selectionView = storyboard?.instantiateViewController(withIdentifier: "selection_screen") as! SideSelectionViewController
        
        present(selectionView, animated: true, completion: nil)
    }
    
}

