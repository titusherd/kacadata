//
//  SiteView.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 20/10/22.
//

import SwiftUI

struct SiteView: Identifiable{
    var id = UUID().uuidString
    var hour: Date
    var views: Double
    var animate: Bool = false
}
extension Date{
    func updateHour(value: Int)->Date{
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}

var sample_analytics: [SiteView] = [
    SiteView(hour: Date().updateHour(value: 8), views: 350),
    SiteView(hour: Date().updateHour(value: 9), views: 400),
    SiteView(hour: Date().updateHour(value: 9), views: 250),
    SiteView(hour: Date().updateHour(value: 9), views: 250),
    SiteView(hour: Date().updateHour(value: 8), views: 500),
    SiteView(hour: Date().updateHour(value: 8), views: 550)
]
