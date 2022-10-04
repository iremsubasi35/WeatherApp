//
//  DailyWeatherTVC.swift
//  WeatherApp
//
//  Created by Irem Subası on 30.09.2022.
//

import Foundation
import UIKit


class DailyWeatherVC : UIViewController,UITableViewDataSource, UITableViewDelegate
{
     private var dailyWeather: [ForecastDay] = []
  

    @IBOutlet weak var dailyWeatherTV: UITableView!

    
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
   

    dailyWeatherTV.register(DailyWeatherCell.nib(), forCellReuseIdentifier: DailyWeatherCell.identifier)
    
     dailyWeatherTV.delegate = self
     dailyWeatherTV.dataSource = self
    
      let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
          service.getDailyWeather(endPoint: "forecast.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&days=7&aqi=no&alerts=no") {       daily, error in
              print(daily)
              print(error)
              
              self.dailyWeather = daily?.forecast?.forecastDay ?? []
              self.title =  daily?.location?.name
              self.dailyWeatherTV.reloadData()
              
              
          }
    
}
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          self.dailyWeatherTV.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         100
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyWeather.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherCell.identifier, for: indexPath) as! DailyWeatherCell
        let model = dailyWeather[indexPath.row]
        cell.updateCell(dailyModel: model)
        
        return cell
    }
    
}
