//
//  Service.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import Foundation
import Alamofire

class Service{
    fileprivate var baseUrl = ""
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    
    func getWeather(endPoint:String,completion:@escaping(Weather?,Error?)->Void){
        AF.request(self.baseUrl + endPoint, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard let data = responseData.data
            else{
                completion(nil,nil)
                return
            }
        }
    }
}
