//
//  UserRouter.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation

class UserRouter {
    static let getUserLocal = UserLocalImpl()
    static let getUserRemote = UserRemoteImpl()
    static let getUserRepository = UserRepositoryImpl(remoteRepo: getUserRemote, localRepo: getUserLocal)
}
