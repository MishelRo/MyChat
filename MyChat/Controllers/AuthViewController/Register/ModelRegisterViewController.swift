//
//  ModelAuthViewController.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import Foundation
import Firebase
import KeychainSwift

class ModelRegisterViewController {
    
    var keychain: KeychainSwift! {
        return KeychainSwift()
    }
    
    func register(user: User, complession: @escaping()->()) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (user, eror) in
            if let error = eror {
                print(error.localizedDescription)
            } else {
                switch user {
                case .none:
                    print("none")
                case .some(let ok):
                    print(ok.user.uid)
                    self.keychain.set(ok.user.uid, forKey: "token")
                    complession()
                }
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
}
