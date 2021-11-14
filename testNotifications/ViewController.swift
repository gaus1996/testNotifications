//
//  ViewController.swift
//  testNotifications
//
//  Created by Apple on 13/11/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    var entData: Products!
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Database.database())
        
        ref = Database.database().reference()
        ref.child("Products").observe(.value) { snapshot in
            
            if !snapshot.exists() { return }
            
            
            guard let data = snapshot.value else { return  }
            do {
                guard let json = try? JSONSerialization.data(withJSONObject: data, options: []) else {return}
                guard let ent = try? JSONDecoder().decode(Products.self, from: json) else { return }
                self.entData = ent
                let size = self.entData.name.shoes.size
                self.lbl1.text = size.type
                self.lbl2.text = size.type1
             }
             catch {
               print(error)
             }
        } withCancel: { err in
            print(err)
        }

       
        //NotificationCenter.default.addObserver(self, selector: #selector(changeScreenColor(notifier:)), name: NSNotification.Name("screenColor"), object: nil)
    }
    
    
}


//extension ViewController {
//    @objc func changeScreenColor(notifier: NotificationCenter) {
//        if let color = UserDefaults.standard.value(forKey: "screenColor") as? String {
//            switch color {
//            case "Red":
//                self.view.backgroundColor = .red
//            case "Blue":
//                self.view.backgroundColor = .blue
//            case "Yellow":
//                self.view.backgroundColor = .yellow
//            case "Orange":
//                self.view.backgroundColor = .orange
//            default:
//                self.view.backgroundColor = .white
//            }
//        }
//    }
//}
