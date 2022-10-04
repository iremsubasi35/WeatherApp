//
//  HourlyModels.swift
//  WeatherApp
//
//  Created by Irem Subası on 4.10.2022.
//

import Foundation

struct HourlyWeatherResponse : Codable{
    let location : HourlyLocation?
    let forecast: HourlyForecast?
}
struct HourlyLocation : Codable {
    let name : String?
}

struct HourlyForecast : Codable {
    let forecastDay : [ForecastHour]
    enum CodingKeys : String , CodingKey{
        case forecastDay = "forecastday"
    }
}

struct ForecastHour : Codable {
    let hour: Hour
    let date : String?
    enum CodingKeys : String , CodingKey{
        case hour , date
        
    }
}

struct Hour: Codable {
    let hourcondition : HourCondition?
    let hourTemp: Double?
    let feltTemp: Double?
    let hourWind : Double?
    let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case humidity
        case hourcondition = "condition"
        case hourTemp = "temp_c"
        case feltTemp = "feelslike_c"
        case hourWind = "wind_kph"
         
    }
}

struct HourCondition : Codable {
   let text : String?
   let icon : String?
}
