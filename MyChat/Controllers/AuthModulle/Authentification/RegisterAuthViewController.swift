//
//  RegisterAuthViewController.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import Foundation
import FirebaseAuth
import KeychainSwift

class RegisterAuthViewController {
    
    func auth(user: User, complession: @escaping(String)->()){
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (user, eror) in
            if eror != nil {
                print(eror?.localizedDescription ?? "")
            }
            if user != nil {
                switch user {
                case .none:
                    print("none")
                case .some(let ok):
                    KeychainSwift().set(ok.user.uid, forKey: "token")
                    complession(ok.user.displayName ?? "")
                }
            }
        }
    }
    
}
