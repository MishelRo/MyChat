//
//  ChatViewModel.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import Firebase
import KeychainSwift
class ChatViewModel {
    
    
    func signOut() {
       try! Auth.auth().signOut()
        KeychainSwift().delete("token")
    }
}
