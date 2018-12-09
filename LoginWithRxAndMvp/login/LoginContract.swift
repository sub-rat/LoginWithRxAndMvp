//
//  LoginContract.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation

protocol LoginPresenter : BasePresenter {
    func doLogin(loginModel: LoginRequest)
    func isUserLoggedIn() -> Bool
}

protocol LoginView {
    func showNetworkMessage(message: String)
    func showLoading(message: String)
    func showLoginSuccess(message: String)
    func showError(message: String)
}
