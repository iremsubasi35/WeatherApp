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
    func updateCell(hourlyModel : Hour){
      //  self.hourLbl.text = 
        self.hourlyWeatherLbl.text = hourlyModel.hourcondition?.text
        
        if let hourTemp = hourlyModel.hourTemp{
            self.hourlyTempLbl.text = "\(hourTemp)"
        }
        if let feltTemp = hourlyModel.feltTemp{
            self.hourlyFeltTempLbl.text = "\(feltTemp)"
        }
        if let hourwind = hourlyModel.hourWind{
            self.hourlyWind.text = "\(hourwind)"
        }
        if let humidity = hourlyModel.humidity{
            self.humidity.text = "\(humidity)"
        }
        let date = Date(timeIntervalSince1970: TimeInterval(hourlyModel.time))
        let calender = Calendar.current
        let hour = calender.component(.hour,from: date)
        let minutes = calender.component(.minute, from: date)
        
        let hourText: String = hour < 10 ? "0\(hour)":"\(hour)"
        let minuteText: String = minutes < 10 ?  "0\(minutes)" : "\(minutes)"
        
        self.hourLbl.text = "\(hourText):" + "\(minuteText)"
        let imagePath = "https:" + (hourlyModel.hourcondition?.icon ?? "")
        let url = URL(string: imagePath)
        self.iconHourly.kf.setImage(with: url)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyWeatherCell", bundle: nil)
    }
   
}
