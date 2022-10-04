//
//  HourlyWeatherVC.swift
//  WeatherApp
//
//  Created by Irem Subası on 3.10.2022.
//

import Foundation
import UIKit

class HourlyWeatherVC : UIViewController,UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var hourlyDateLbl: UILabel!
    @IBOutlet weak var hourlyCityLbl: UILabel!
    
    
    private var hourlyWeather: [ForecastHour] = []
    @IBOutlet weak var hourlyWeatherTV: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourlyWeatherTV.delegate = self
        hourlyWeatherTV.dataSource = self
        
        let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
            service.getHourlyWeather(endPoint: "forecast.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&days=7&aqi=no&alerts=no") {       hourly, error in
                print(hourly)
                print(error)
        self.hourlyWeather = hourly?.forecast?.forecastDay ?? []
              //  self.hourlyDateLbl.text ?
        self.hourlyWeatherTV.reloadData()
             
            }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hourlyWeather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HourlyWeatherCell.identifier, for: indexPath) as! HourlyWeatherCell
        
        let model = hourlyWeather[indexPath.row]
        cell.updateCell(hourlyModel: model)

        return cell
    }
    
}

