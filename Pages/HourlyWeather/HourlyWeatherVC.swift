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
    var dayIndex : Int = 0
    
    private var hourlyWeather: [Hour] = []
    @IBOutlet weak var hourlyWeatherTV: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather"
        
        hourlyWeatherTV.register(HourlyWeatherCell.nib(), forCellReuseIdentifier: HourlyWeatherCell.identifier)
        
        hourlyWeatherTV.delegate = self
        hourlyWeatherTV.dataSource = self
        
        let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
            service.getHourlyWeather(endPoint: "forecast.json?key=71072d057ba4417e9d8190629213103&q=izmir&days=10&aqi=no&alerts=no") {       hourly, error in
                print(hourly)
                print(error)
                
                if let hourly = hourly {
                    if let location = hourly.location{
                        self.hourlyCityLbl.text = location.name
                    }
                    if let forecast = hourly.forecast{
                        self.hourlyWeather = forecast.forecastDay[self.dayIndex].hour
                        self.hourlyDateLbl.text = forecast.forecastDay[self.dayIndex].date ?? "-"
                    }
                }
                else{
                    self.hourlyWeather=[]
                    self.hourlyDateLbl.text = "-"
                }
        self.hourlyWeatherTV.reloadData()
             
            }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourlyWeather.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HourlyWeatherCell.identifier, for: indexPath) as! HourlyWeatherCell
        
        let model = hourlyWeather[indexPath.row]
        cell.updateCell(hourlyModel: model)

        return cell
    }
    
}

