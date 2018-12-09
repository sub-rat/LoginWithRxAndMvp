//
//  LoginResponse.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginResponse: Mappable {

    var id: Int?
    var userGroup: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var mobileNumber: String?
    var accessToken: String?
    var refreshToken: String?
    var buId: Int?
    var buName: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id_user"]
        userGroup <- map["user_group"]
        email <- map["email"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        mobileNumber <- map["mobile_number"]
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        buId <- map["bu_id"]
        buName <- map["bu_name"]
    }
}
