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
    
    
    func getWeather(endPoint:String,completion:@escaping(WeatherResponse?,Error?)->Void){
        AF.request(self.baseUrl + endPoint, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard
                let data = responseData.data
            else{
                completion(nil,nil)
                return
            }
            do {
                    let Air = try JSONDecoder().decode(WeatherResponse.self, from: data)
                           completion(Air,nil)
                        } catch {
                            print("error==\(error)")
                            completion(nil,error)
                        }
                    }
        }
    
    func getDailyWeather(endPoint:String,completion:@escaping(DailyWeatherResponse?,Error?)->Void){
        AF.request(self.baseUrl + endPoint, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard
                let data = responseData.data
            else{
                completion(nil,nil)
                return
            }
            do {
                            let dailyResponse = try JSONDecoder().decode(DailyWeatherResponse.self, from: data)
                            
                            completion(dailyResponse,nil)
                        } catch {
                            print("error==\(error)")
                            completion(nil,error)
                        }
                    }
        }
    func getHourlyWeather(endPoint:String,completion:@escaping(HourlyWeatherResponse?,Error?)->Void){
        AF.request(self.baseUrl + endPoint, headers: nil, interceptor: nil, requestModifier: nil).response { (responseData) in
            guard
                let data = responseData.data
            else{
                completion(nil,nil)
                return
            }
            do {
                            let hourlyResponse = try JSONDecoder().decode(HourlyWeatherResponse.self, from: data)
                            
                            completion(hourlyResponse,nil)
                        } catch {
                            print("error==\(error)")
                            completion(nil,error)
                        }
                    }
        }
    
    }

