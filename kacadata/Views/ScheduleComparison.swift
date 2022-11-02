//
//  ScheduleComparison.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 01/11/22.
//

import SwiftUI

struct ScheduleComparison: View {
    @Environment(\.calendar) var calendar
    @State private var dates = Set<DateComponents>()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                MultiDatePicker(selection: $dates, in: .init(uncheckedBounds: (Date.now,Date.init(timeIntervalSinceNow: 3000000))), label: {
                    Text("Pick Dates")
                })
                .frame(width: 372,
                       height: 372)
                .padding()
                .navigationTitle("Calendar View")
                
                ForEach(selectedDates, id: \.self){ date in
                    Text(date, format: .dateTime)
                }

            }

        }
    }
    
    var selectedDates: [Date] {
        dates.compactMap {
            calendar.date(from: $0)
        }.sorted()
    }
}

struct ScheduleComparison_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleComparison()
    }
}
