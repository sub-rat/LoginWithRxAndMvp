//
//  Utils.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func showAlertDialog(title:String?, message:String?) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
    
    static func showLoadingIndicator(viewController:UIViewController)-> UIActivityIndicatorView{
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = viewController.view.center
        indicator.hidesWhenStopped = true
        viewController.view.addSubview(indicator)
        viewController.view.bringSubviewToFront(indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return indicator
    }
}
