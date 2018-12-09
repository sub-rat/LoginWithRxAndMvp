//
//  UserLocalImpl.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation

class UserLocalImpl: UserLocalRepo  {
    
    var prefs = PreferenceManager.getInstance
    func saveUsername(loginResponse: LoginResponse) {
        
    }
    
    func isUserLoggedIn() -> Bool {
        return prefs.isUserLoggedIn()
    }
    
    
}
