//
//  PreferenceManager.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation

class PreferenceManager {
    
    static let getInstance = PreferenceManager()
    
    func setUserName(loginResonse: LoginResponse) {
        UserDefaults.standard.set(loginResonse.firstName!, forKey: "Username")
    }
    
    func isUserLoggedIn() -> Bool {
        let username = UserDefaults.standard.string(forKey: "Username")
        return username != nil && username != ""
    }
    
    func removeLoggedInUser()  {
        UserDefaults.standard.set("", forKey: "Username")
    }
}
