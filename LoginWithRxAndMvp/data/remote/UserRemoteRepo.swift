//
//  UserRemoteRepository.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import RxSwift

protocol UserRemoteRepo {
   func doLogin(loginModel : LoginRequest) -> Observable<LoginResponse>
}
