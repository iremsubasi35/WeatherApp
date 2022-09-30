//
//  DailyWeatherCell.swift
//  WeatherApp
//
//  Created by Irem Subası on 30.09.2022.
//

import Foundation
import UIKit

class DailyWeatherCell: UITableViewCell {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dailyWeatherLbl: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var preciption: UILabel!
    @IBOutlet weak var iconDaily: UIImageView!
    @IBOutlet weak var maxWind: UILabel!
    
    func DailyCell(){
        let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
                service.getDailyWeather(endPoint: "forecast.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&days=7&aqi=no&alerts=no") { daily, error in
                    print(daily)
                    print(error)
             
    }
}
}
