//
//  ViewController.swift
//  WeatherApp
//
//  Created by Irem Subası on 27.09.2022.
//

import UIKit

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
                service.getWeather(endPoint: "current.json?key=f1251bf35ec54bd1adb145144222509&q=izmir&aqi=no") { movies, error in
                 //   self.weatherPage = weatherPage.results ?? []
                    print(movies)
                    print(error)
                }

    }


}

