//
//  HourlyWeather.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import Foundation
import UIKit

class HourlyWeatherCell : UITableViewCell{
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var hourlyWeatherLbl: UILabel!
    @IBOutlet weak var hourlyTempLbl: UILabel!
    @IBOutlet weak var hourlyFeltTempLbl: UILabel!
    @IBOutlet weak var hourlyWind: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var iconHourly: UIImageView!
    
    static let identifier : String = "HourlyWeatherCell"
    func updateCell(hourlyModel : ForecastHour){
        
        self.hourlyWeatherLbl.text = hourlyModel.hour.hourcondition?.text
        
        if let hourTemp = hourlyModel.hour.hourTemp{
            self.hourlyWeatherLbl.text = "\(hourTemp)"
        }
        if let feltTemp = hourlyModel.hour.feltTemp{
            self.hourlyFeltTempLbl.text = "\(feltTemp)"
        }
        if let hourwind = hourlyModel.hour.hourWind{
            self.hourlyWind.text = "\(hourwind)"
        }
        if let humidity = hourlyModel.hour.humidity{
            self.humidity.text = "\(humidity)"
        }
        
        let imagePath = "https:" + (hourlyModel.hour.hourcondition?.icon ?? "")
        let url = URL(string: imagePath)
        self.iconHourly.kf.setImage(with: url)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyWeatherCell", bundle: nil)
    }
   
}
