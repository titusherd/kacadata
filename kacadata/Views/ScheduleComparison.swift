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
    @State var selectedDate: Date = Date()
    
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                MultiDatePicker(selection: $dates, in: .init(uncheckedBounds: (Date.now,Date.init(timeIntervalSinceNow: 3000000))), label: {
                    Text("Pick Dates")
                })
//                .tint(Color.CustomTeal)
                .tint(Color.CustomDarkTeal)
                .frame(width: 372,
                       height: 372)
                .padding(.horizontal)
//                .navigationTitle("Pick Date")
                
                CustomDivider()
                    .padding(.top, -15.0)
                
//                ForEach(selectedDates, id: \.self){ date in
//                    Text(date, format: .dateTime)
//                }
                
                HStack(alignment: .center){
                    Spacer()
                    
                    HStack(){
                        
                    }
                    
                    Spacer()
                    
                    (Text("Start from :\n\n").font(.system(size: 14, weight: .regular))
                     
                     +
                     
                     Text(dateFormatter.string(from: selectedDate))                            .foregroundColor(.CustomDarkTeal)
                        .font(.system(size: 14, weight: .bold))
                    )
                        .multilineTextAlignment(.leading)
                        
                    
                    Spacer()
                    
                    (Text("Until :\n\n").font(.system(size: 14, weight: .regular))
                     
                     +
                     
                     Text(dateFormatter.string(from: selectedDate))
                        .foregroundColor(.CustomDarkTeal)
                        .font(.system(size: 14,weight: .bold))
                    )
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    HStack(){
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, -230.0)
                .padding(.top, 8.0)
                
                Spacer()
                
                NavigationLink(
                    destination: Text("This is page for Dashboard"),
                    label: {
                        Text("Done")
                            .frame(width: 358,
                                   height: 48,
                                   alignment: .center)
                            .background(Color.CustomTeal)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                            .font(.system(size: 14,
                                          weight: .semibold,
                                          design: .rounded))
                    }
                )
                .padding(.top, 240.0)

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
