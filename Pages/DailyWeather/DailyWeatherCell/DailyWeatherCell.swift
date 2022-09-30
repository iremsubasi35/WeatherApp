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
    
    @IBOutlet weak var maxTempLbl: UILabel!
    @IBOutlet weak var minTempLbl: UILabel!
    @IBOutlet weak var preciptionLbl: UILabel!
    
    @IBOutlet weak var maxWindLbl: UILabel!
    @IBOutlet weak var iconDaily: UIImageView!
    
    
    static let identifier : String = "DailyWeatherCell"
    
    func updateCell(dailyModel : ForecastDay){
        self.date.text = dailyModel.dailyDate
        self.dailyWeatherLbl.text = dailyModel.day.daycondition?.text
        
        //DOUBLE
      //  if let dailyWeatherModel = dailyModel.day
        if dailyModel.day != nil {
            if let maxTemps = dailyModel.day.maxTempCelcius {
                self.maxTempLbl.text = "\(maxTemps)"
            }
            if let minTemps = dailyModel.day.minTempCelcius{
                self.minTempLbl.text = "\(minTemps)"
            }
            if let preciption = dailyModel.day.totalPreciption{
                self.preciptionLbl.text = "\(preciption)"
            }
            if let maxWinds = dailyModel.day.maxWind{
                self.maxWindLbl.text = "\(maxWinds)"
            }
        }
        
        // İCON
        let imagePath = "https:" + (dailyModel.day.daycondition?.icon ?? "")
        let url = URL(string: imagePath)
        self.iconDaily.kf.setImage(with: url)
        
    }
    static func nib() -> UINib {
        return UINib(nibName: "DailyWeatherCell", bundle: nil)
    }
    
}

