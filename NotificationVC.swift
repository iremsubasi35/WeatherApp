//
//  NotificationVC.swift
//  WeatherApp
//
//  Created by Irem Subası on 11.10.2022.
//

import Foundation
import UserNotifications
import UIKit


class NotificationVC: UIViewController{
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { permissionGranted, error in
            if(!permissionGranted){
                print("Permission Denied")
            }
        }
    }
    
    @IBAction func notificationButton(_ sender: Any) {
        notificationCenter.getNotificationSettings{ (settings) in
            DispatchQueue.main.async {
            
            
            let date = self.datePicker.date
            if(settings.authorizationStatus == .authorized){
                let content = UNMutableNotificationContent()
                content.title = "Weather Application"
                content.body = "If you know  weather You should open this aplication !"
                let dateComp = Calendar.current.dateComponents([.year,.month,.day ,.hour,.minute], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                self.notificationCenter.add(request) { (error) in
                    if(error != nil){
                        print("Error" + error.debugDescription)
                        return
                    }
                }
                let ac = UIAlertController(title: "Weather Notification", message: "At" + self.formattedDate(date: date), preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                self.present(ac,animated: true)
            }
            else {
                let ac = UIAlertController(title: "Enable Notification?", message: "To use this feature you must enable notifications in settings" + self.formattedDate(date: date), preferredStyle: .alert)
                let goToSettings = UIAlertAction(title: "Settings", style: .default)
                { (_) in
                    guard
                        let settingURL = URL(string: UIApplication.openSettingsURLString)
                    else{
                        return
                    }
                    if(UIApplication.shared.canOpenURL(settingURL)){
                        UIApplication.shared.open(settingURL) { (_) in}
                    }
                }
                ac.addAction(goToSettings)
                ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in}))
                self.present(ac,animated: true)
                
            }
            }
    }
    
    
}
    func formattedDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y HH:mm"
        
        return formatter.string(from: date)
    }
}
