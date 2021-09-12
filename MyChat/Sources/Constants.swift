//
//  Constants.swift
//  MyChat
//
//  Created by User on 12.09.2021.
//

import Foundation
import Firebase
struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
