//
//  DailyWeatherTVC.swift
//  WeatherApp
//
//  Created by Irem Subası on 30.09.2022.
//

import Foundation
import UIKit

class DailyWeatherVC : UIViewController//,UITableViewDataSource, UITableViewDelegate
{
  

    @IBOutlet weak var dailyWeatherTV: UITableView!
    @IBOutlet weak var dailyCityName: UILabel!
    
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    
      let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
          service.getDailyWeather(endPoint: "forecast.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&days=7&aqi=no&alerts=no") {       daily, error in
              print(daily)
              print(error)
              self.dailyCityName.text =  daily?.location?.name
          }
    
}
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//         120
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
}
