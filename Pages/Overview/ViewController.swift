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
   
    @IBAction func notification(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NotificationVC") as!  NotificationVC
        self.navigationController?.pushViewController(viewController, animated: true)
         
    }
    
    @IBAction func showMore(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DailyWeatherVC") as!  DailyWeatherVC
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather"
        //configureItems()
        let service = Service(baseUrl: "https://api.weatherapi.com/v1/")
                service.getWeather(endPoint: "current.json?key=71072d057ba4417e9d8190629213103&q=izmir&aqi=no") { hava, error in
                    print(hava)
                    print(error)
                    
                    self.lblCity.text = hava?.location?.name
                    self.textWeather.text = hava?.current?.condition?.text
                    
                    if let current = hava?.current {
                        if let temp = current.temp {
                            self.tempWeather.text = "\(temp)"
                        }
                        if let ftemp = current.feelTemp{
                            self.feelTemp.text = "\(ftemp)"
                        }
                        if let winds = current.wind {
                            self.windSpeed.text = "\(winds)"
                        }
                    }
        
                    self.lastUpdate.text = hava?.current?.lastUpdated
                    //İCON
                    let imagePath = "https:" + (hava?.current?.condition?.icon ?? "")
                    let url = URL(string: imagePath)
                    self.iconWeather.kf.setImage(with: url)
                    
                }
        
}
   //  func configureItems(){
   //     let image = UIImage(systemName: "bell")
   //     self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(addTapped))
   //     navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
  //  }
}
