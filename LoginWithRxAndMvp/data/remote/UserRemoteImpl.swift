//
//  UserRemoteRepositoryImpl.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import RxSwift

class UserRemoteImpl: UserRemoteRepo {
    func doLogin(loginModel: LoginRequest) -> Observable<LoginResponse> {
        let username = loginModel.username
        let password = loginModel.password
        let params = ["username": username, "password": password]
        
        return ApiService.shared.requestData(T: LoginResponse.self,
                                             url: Urls.loginUrl,
                                             method: .post,
                                             parameters: params,
                                             header: nil)
    }
}
