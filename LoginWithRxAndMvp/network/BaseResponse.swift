//
//  BaseResponse.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseResponse<T: Mappable>: Mappable {
    
    var statusCode: Int = 0
    var debugCode: Int = 0
    var message: String = ""
    var data: T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        statusCode <- map["status_code"]
        debugCode <- map["debug_code"]
        message <- map["message"]
        data <- map["data"]
    }
}
