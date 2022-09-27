//
//  Model.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import Foundation


struct Weather{
    let name : String?
    let temp : Double?
    let wind : Double?
    let feelTemp : Double?
    let update : Timer?  //tarih ve saat için araştır
    let weatherText : String?
    let icon : String?
    enum CodingKeys: String,CodingKey{
        case name , icon
        case temp = "temp_c"
        case wind = "wind_mph"
        case feelTemp = "feelslike_c"
        case update = "last_updated"
        case weatherText = "text"
        
    }
    struct CellModel{
        let time : Date? //??
        let text : String?
        let temp : Double?
        let icon : String?
        enum CodingKeys: String,CodingKey{
            case time,text,icon
            case temp = "temp_c"
            
        }
    }
}
