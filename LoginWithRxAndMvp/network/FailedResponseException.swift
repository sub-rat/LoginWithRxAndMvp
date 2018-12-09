//
//  FailedResponseException.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation

class FailedResponseException: NSError{
    var statusCode: Int
    var statusMessage: String
    
    init(statusCode: Int, statusMessage: String) {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
        super.init(domain: "FailedResponseException", code: statusCode, userInfo: [NSLocalizedDescriptionKey : statusMessage])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
