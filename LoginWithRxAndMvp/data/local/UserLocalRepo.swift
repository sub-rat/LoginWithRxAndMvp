//
//  UserLocalRepo.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation

protocol UserLocalRepo {
    func saveUsername(loginResponse:LoginResponse)
    func isUserLoggedIn()-> Bool
}
