//
//  User.swift
//  NIFTYPractice
//
//  Created by 成田篤基 on 2018/04/05.
//  Copyright © 2018年 Atsuki Narita. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String
    var password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
    func signUp(callback: @escaping (_ message: String?) -> Void) {
        let user = NCMBUser()
        user.userName = name
        user.password = password
        user.signUpInBackground{ (error) in
            let nserror = error as NSError?
            callback(_ : nserror?.userInfo["NSLocalizedDescription"] as? String)
            
        }
    }
    
    func login(callback: @escaping (_ message: String?) -> Void) {
        NCMBUser.logInWithUsername(inBackground: self.name, password: self.password) { (user, error) in
            let nserror = error as NSError?
            callback(_ : nserror?.userInfo["NSLocalizedDescription"] as? String)
        }
    }
}
