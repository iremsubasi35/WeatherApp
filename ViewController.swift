//
//  ViewController.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var iconWeather: UIImageView!
    @IBOutlet weak var textWeather: UILabel!
    @IBOutlet weak var tempWeather: UILabel!
    @IBOutlet weak var feelTemp: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var lastUpdate: UILabel!
    @IBAction func showMore(_ sender: Any) {
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather"
        let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
                service.getWeather(endPoint: "current.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&aqi=no") { hava, error in
                    print(hava)
                    print(error)
                    
                    self.lblCity.text = hava?.location?.name
                    self.textWeather.text = hava?.current?.condition?.text
                    self.tempWeather.text = "\(hava?.current?.temp)"
        self.feelTemp.text = "\(hava?.current?.feelTemp)"
        self.windSpeed.text = "\(hava?.current?.wind)"
                    self.lastUpdate.text = hava?.current?.lastUpdated
                    //İCON
                    let imagePath = "https:" + (hava?.current?.condition?.icon ?? "")
                    let url = URL(string: imagePath)
                    self.iconWeather.kf.setImage(with: url)
                    
                }
    }
    
        
    
   

}

