//
//  ApiService.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift
import RxAlamofire

class ApiService {
    static let shared = ApiService()
    
    private init(){
        
    }
    
    func requestData<T: Mappable>(T : T.Type,
                                  url : String,
                                  method : HTTPMethod? = .get,
                                  parameters : Parameters? = nil,
                                  header : HTTPHeaders? = nil) -> Observable<T> {
        return RxAlamofire.requestJSON(method!, url, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
        .mapBaseResponse(type: BaseResponse<T>.self)
            .flatMap{ response in NotNullMapper(t: response)}
    }
}
