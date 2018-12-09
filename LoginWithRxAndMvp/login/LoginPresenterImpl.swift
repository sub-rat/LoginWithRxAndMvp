//
//  LoginPagePresenter.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenterImpl: LoginPresenter {
  
    private var repository: UserRepository
    private var view: LoginView
    private var disposable : Disposable?
    
    init(view: LoginView, repository: UserRepository) {
        self.view = view
        self.repository = repository
    }
    
    func start() {
        
    }
    
    func stop() {
        disposable?.dispose()
    }
   
    func doLogin(loginModel: LoginRequest) {
        self.view.showLoading(message: "Please wait...")
        
        disposable = repository.doLogin(loginModel: loginModel)
            .subscribe(onNext: {
                            (loginResponse) in self.view.showLoginSuccess(message: "Login Success")
                        },
                       onError: {
                            (error) in
                        print(error)
                        if(error is FailedResponseException){
                            self.view.showError(message: error.localizedDescription)
                        }else{
                            self.view.showError(message: "Oops! something went wrong")
                        }
                        })
       
    }
    
    func isUserLoggedIn() -> Bool {
        return repository.isUserLoggedIn()
    }
    
  
    
    
}
