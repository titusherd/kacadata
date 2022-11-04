//
//  ScheduleComparison.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 01/11/22.
//

import SwiftUI

struct ScheduleComparison: View {
    let image = Image(systemName: "chevron.down")
    
    @Environment(\.calendar) var calendar
    @Environment(\.presentationMode) var presentationMode
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            // MARK: - Monthly Modal
            Button(){
                showSheet.toggle()
            }  label: {(Text("Monthly  ") + Text(image))
                .frame(width: 81,
                       height: 28
                )
                .font(.system(size:11
                              ,weight: .semibold
                              ,design: .rounded
                             )
                )
                .foregroundColor(.CustomDarkTeal2)
                .cornerRadius(4)
            }
            .overlay(RoundedRectangle(cornerRadius:4, style: .continuous).stroke(Color.CustomTeal, lineWidth: 2))
            .sheet(isPresented: $showSheet, content: {
                CalendarScreen()
            })
        }
    }
}

struct CalendarScreen: View {
    let xmark = Image(systemName: "xmark")
    
    @Environment(\.calendar) var calendar
    @Environment(\.presentationMode) var presentationMode
    @State var selectedDate: Date = Date()
    @State private var dates = Set<DateComponents>()

    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    var body: some View{
        ZStack{
            Color.CustomTeal
                .edgesIgnoringSafeArea(.all)
            
            ZStack{
                //Color.white
                
                VStack{
                    HStack{
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {Text(xmark)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        })
                        Spacer()
                        
                        Text("Schedule your bundle")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    .padding(.top, 17.0)
                    .padding(.bottom, 14.0)
                    .padding(.horizontal, 30.0)
                    
                    VStack{
                        MultiDatePicker(selection: $dates, in: .init(uncheckedBounds: (Date.now,Date.init(timeIntervalSinceNow: 3000000))), label: {
                            Text("Pick Dates")
                        })
                        //.tint(Color.CustomTeal)
                        .tint(Color.CustomDarkTeal)
                        .frame(width: 372,
                               height: 372)
                        .padding(.horizontal)
                        .padding(.top, 8.0)
                        //.navigationTitle("Pick Date")
                        
                        Divider()
                            .padding(.top, -15.0)
                        
                        //CustomDivider()
                        //.padding(.top, -15.0)
                        
                        //ForEach(selectedDates, id: \.self){ date in
                        //Text(date, format: .dateTime)
                        //}
                        
                        HStack(alignment: .center){
                            Spacer()
                            
                            HStack(){
                                
                            }
                            
                            Spacer()
                            
                            (Text("Start from :\n\n").font(.system(size: 14, weight: .regular))
                             
                             //                         +
                             //
                             //                         Text(dates.description)
                             
                             +
                             
                             Text(dateFormatter.string(from: selectedDate))     .foregroundColor(.CustomDarkTeal)
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
                        .padding(.bottom)
                        //.padding(.top, 220.0)
                    }.background(Color.white)
                }
            }
        }
    }
}

struct ScheduleComparison_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleComparison()
    }
}
