//
//  ViewController.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginView{
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
   
    private var presenter: LoginPresenter?
    private var progress: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPresenterImpl(view: self, repository: UserRouter.getUserRepository)
        
        let loggedIn = self.presenter?.isUserLoggedIn()
        if (loggedIn!) {
            print(loggedIn!)
            // TODO add other impl. if user is logged In
        }
    }

    @IBAction func onLoginButtonClicked(_ sender: UIButton) {
        let mUsername = username.text
        let mPassword = password.text
        
        if mUsername == ""{
            username.shakeOnError(baseColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), numberOfShakes: 2, revert: true)
        } else if mPassword == ""{
            password.shakeOnError(baseColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), numberOfShakes: 2, revert: true)
        } else {
            let loginRequest = LoginRequest(username: mUsername!, password: mPassword!)
            self.presenter?.doLogin(loginModel: loginRequest)
        }
    }
    func showNetworkMessage(message: String) {
         self.showAlertDialog(title: "Network Error", message: message)
    }
    
    func showLoading(message: String) {
        progress =  Utils.showLoadingIndicator(viewController:self)
        progress?.startAnimating()
    }
    
    func showLoginSuccess(message: String) {
        DispatchQueue.main.async {
            self.hideDialog()
            self.showAlertDialog(title: "Login Success", message: message)
        }
        
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            self.hideDialog()
            self.showAlertDialog(title: "Login Error", message: message)
        }
    }
    private func hideDialog(){
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        progress?.stopAnimating()
    }
    
    private func showAlertDialog(title:String?, message:String?){
        let alert = Utils.showAlertDialog(title:title,message:message)
        self.present(alert, animated: true, completion: nil)
    }
}

