//
//  ObservableType.swift
//  LoginWithRxAndMvp
//
//  Created by Subrat Gyawali on 12/9/18.
//  Copyright © 2018 Subrat Gyawali. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

extension ObservableType {
    public func mapBaseResponse<T : Mappable>(type : T.Type) -> Observable<T> {
        return  flatMap { data -> Observable<T> in
            guard let (_, object) = data as? (HTTPURLResponse, Any),
                let value = Mapper<T>().map(JSONObject: object) else {
                    print("Json parse Exception")
                    throw NSError(
                          domain: "Json parse exception",
                          code: -1,
                          userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"])
            }
             return Observable.just(value)
        }
    }
    
    public func mapArray<T : Mappable>(type : T.Type) -> Observable<[T]> {
        return flatMap{ data -> Observable<[T]> in
            guard let (_, objects) = data as? (HTTPURLResponse, Any),
                let values = Mapper<T>().mapArray(JSONObject: objects) else {
                    throw NSError(
                        domain: "com.example",
                        code: -1,
                        userInfo: [NSLocalizedDescriptionKey : "ObjectMapper can't mapping"])
            }
            return Observable.just(values)
        }
    }
    
}
