//
//  UserRepositoryImpl.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import RxSwift

class UserRepositoryImpl: UserRepository {

    var remoteRepo: UserRemoteRepo
    var localRepo: UserLocalRepo
    
    init(remoteRepo: UserRemoteRepo, localRepo: UserLocalRepo) {
        self.remoteRepo = remoteRepo
        self.localRepo = localRepo
    }
    
    func doLogin(loginModel: LoginRequest) -> Observable<LoginResponse> {
        return remoteRepo.doLogin(loginModel: loginModel)
        .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        .subscribeOn(MainScheduler())
    }
    
    func isUserLoggedIn() -> Bool {
        return localRepo.isUserLoggedIn()
    }
    

}
