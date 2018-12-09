//
//  UserRepository.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRepository {
    func doLogin(loginModel : LoginRequest) -> Observable<LoginResponse>
    func isUserLoggedIn()-> Bool
}
