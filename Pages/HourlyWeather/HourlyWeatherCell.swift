//
//  HourlyWeather.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import Foundation
import UIKit

class HourlyWeatherCell : UIViewController //,UITableViewDelegate,UITableViewDataSource
{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredCurrencyModels.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//            return 24
//        }
    
    @IBOutlet weak var hourlyTVC: UITableView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
          let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
              service.getWeather(endPoint: "forecast.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&days=1&aqi=no&alerts=no") {       movies, error in
                  print(movies)
                  print(error)
              }
        
}
}
