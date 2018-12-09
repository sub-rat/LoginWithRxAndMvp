//
//  NotNullMapper.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

func NotNullMapper<T : Mappable>(t : BaseResponse<T>) -> Observable<T> {
    if(t.statusCode == 200){
        if(t.data != nil){
            return Observable.just(t.data!)
        }else {
            return Observable.error(FailedResponseException(statusCode: t.statusCode, statusMessage: t.message))
        }
    }else{
        if(t.statusCode == 0){
            print("404 -> Unknown host excception")
            return Observable.error(FailedResponseException(statusCode: 404, statusMessage: "Oops! something went wrong"))
        } else {
            return Observable.error(FailedResponseException(statusCode: 500, statusMessage: "Server Error"))
        }
    }
}
