//
//  DailyModel.swift
//  WeatherApp
//
//  Created by Irem Subası on 30.09.2022.
//

import Foundation

struct DailyWeatherResponse : Codable{
    let location : DailyLocation?
    let forecast: Forecast?
}

struct DailyLocation : Codable {
    let name : String?
}

struct Forecast : Codable {
    let forecastDay : [ForecastDay]
    enum CodingKeys : String , CodingKey{
        case forecastDay = "forecastday"
    }
}

struct ForecastDay : Codable {
    let day: Day
    let dailyDate : String?
    enum CodingKeys : String , CodingKey{
        case day = "day"
        case dailyDate = "date"
    }
    
    
}

struct Day: Codable {
    let daycondition : DayCondition?
    let maxTempCelcius: Double?
    let minTempCelcius: Double?
    let maxWind : Double?
    let totalPreciption: Double?
    
    enum CodingKeys: String, CodingKey {
        case daycondition = "condition"
        case maxTempCelcius = "maxtemp_c"
        case minTempCelcius = "mintemp_c"
        case maxWind = "maxwind_kph"
        case totalPreciption = "totalprecip_mm"
    }
}

 struct DayCondition : Codable {
    let text : String?
    let icon : String?
}
