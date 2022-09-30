//
//  Model.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import Foundation

struct WeatherResponse : Codable{
    let current : Current?
    let location : Location?
    //let forecast: Forecast?
}

struct Location : Codable {
    let name : String?
}

struct Condition : Codable{
    let text : String?
    let icon : String?
}

struct Current : Codable{
    let condition : Condition?
    let temp : Double?
    let wind : Double?
    let feelTemp : Double?
    let lastUpdated : String?
    enum CodingKeys: String,CodingKey{
        case condition
        case lastUpdated = "last_updated"
        case temp = "temp_c"
        case wind = "wind_kph"
        case feelTemp = "feelslike_c"
    }
}

struct CellModel: Codable{
    let time : String?
    let text : String?
    let temp : Double?
    let icon : String?
    enum CodingKeys: String,CodingKey{
        case time,text,icon
        case temp = "temp_c"
        
    }
}


//struct Weather: Codable{
//    let condition : Condition?
//    let name : String?
//    let temp : Double?
//    let wind : Double?
//    let feelTemp : Double?
//    let update : String?
//    let weatherText : String?
//    let icon : String?
//    enum CodingKeys: String,CodingKey{
//        case name , icon , condition
//        case temp = "temp_c"
//        case wind = "wind_kph"
//        case feelTemp = "feelslike_c"
//        case update = "last_updated"
//        case weatherText = "text"
//
//    }
//}
