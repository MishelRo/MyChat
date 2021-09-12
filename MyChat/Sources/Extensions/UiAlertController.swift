//
//  UiAlertController.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import UIKit
extension UIAlertController {
    func getAlert(complession: @escaping(UIAlertController)->(),complessionString: @escaping(String)->()) {
        let defaults = UserDefaults.standard
        
        let alert = UIAlertController(title: "Your Display Name", message: "Before you can chat, please enter your chat name. Others will see this name when you send chat messages. You can change your display name again by tapping the navigation bar.", preferredStyle: .alert)
        alert.addTextField { textField in
            if let name = defaults.string(forKey: "jsq_name")
            {
                textField.text = name
            }
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self, weak alert] _ in
            
            if let textField = alert?.textFields?[0], !textField.text!.isEmpty {
                let text = textField.text
                complessionString(text ?? "")
                defaults.set(textField.text, forKey: "jsq_name")
                defaults.synchronize()
            }
        }))
        complession(alert)
    }
}
