//
//  DatabaseManager.swift
//  LogInLogUp
//
//  Created by Yeskendir on 29.05.2023.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    
    private let database =  Database.database().reference()
 
}

//MARK: - Account Management
extension DatabaseManager {
    
    public func userExists(with email: String, competion: @escaping((Bool) -> Void)){
        
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                competion(false)
                return
            }
            competion(true)
        })
    }
    
    // Insert New user
    public func insertUser(with user: TestAppUser) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "second_name": user.secondName
        ])
    }

}
struct TestAppUser{
    let firstName: String
    let secondName: String
    let emailAddress: String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
}
