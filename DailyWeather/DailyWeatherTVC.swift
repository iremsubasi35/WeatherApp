//
//  DailyWeatherTVC.swift
//  WeatherApp
//
//  Created by Irem Subası on 30.09.2022.
//

import Foundation
import UIKit

class DailyWeatherTVC : UIViewController{
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var dailyTextWeather: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxWind: UILabel!
    @IBOutlet weak var minWind: UILabel!
    @IBOutlet weak var dailyiCon: UIImageView!
    
override func viewDidLoad() {
        super.viewDidLoad()
    
      let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
          service.getDailyWeather(endPoint: "forecast.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&days=7&aqi=no&alerts=no") {       dailyweather, error in
              print(dailyweather)
              print(error)
          }
    
}
}
