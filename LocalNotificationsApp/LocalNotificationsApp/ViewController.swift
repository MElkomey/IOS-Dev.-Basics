//
//  ViewController.swift
//  LocalNotificationsApp
//
//  Created by Mohamed Elkomey on 25/06/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnSendNotification(_ sender: Any) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert ,.sound ,.badge]) { granted, error in
            if granted{
                print("granted")
                DispatchQueue.main.async {
                    self.scheduleNotification()
                }
            }else{
                print("denied")
            }
        }
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "Subtitle"
        content.body = "my notification"
        content.sound = .default
        content.badge = 1
        //pass data
        content.userInfo = ["name":"my name"]
        
        //every five seconds
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5), repeats: false)
        //in exact time
//        var component = DateComponents()
//        component.calendar = Calendar.current
//        //sunday
//        component.weekday = 1
//        component.hour = 18
//        component.minute = 22
     //   let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        
        //by date picker
        let date = self.datePicker.date
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year , .month ,.day ,.hour ,.minute ,.second], from: date), repeats: false)
        
        let request = UNNotificationRequest(identifier: "testID", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    @IBAction func btnDeleteNotification(_ sender: Any) {
        //remove all future notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        // remove future notification bt id
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["testID"])
}

}
