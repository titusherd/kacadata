//
//  DashboardOverview.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 19/10/22.
//

import SwiftUI
import Charts

struct DashboardOverview: View {
    let image = Image(systemName: "chevron.down")
    let up = Image(systemName: "arrow.up")
    let down = Image(systemName: "arrow.down")
    
    @State var sampleAnalytics: [SiteView] = sample_analytics
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                // MARK: - Dashboard Heading
                VStack{
                    HStack{
                        Text("Dashboard")
                            .font(.system(size:36
                                          ,weight: .bold
                                          ,design: .rounded
                                         )
                            )
                        
                        Spacer()
                        
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
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }
                        .sheet(isPresented: $showSheet) {
                            Text("Choose Period of Time")
                                .font(.system(size:13
                                              ,weight: .bold
                                              ,design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 8.0)
                            
                            Text("Select the time you want to see the details of the data or insight about the data.")
                                .font(.system(size:13
                                              ,weight: .regular
                                              ,design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 8.0)
                                .padding(.horizontal, 32.0)
                            
                            
                            
                                .presentationDetents([.large, .fraction(0.75)])
                        }
                    }
                    .padding([.top, .leading, .trailing])
                    .padding(.bottom, 25.0)
                    
                    VStack(alignment: .center){
                        // MARK: - Overview Card
                        HStack(spacing: 5){
                            Text("| Overview")
                                .font(.system(size:16,
                                              weight: .semibold,
                                              design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .padding([.top, .leading, .trailing])
                        .padding(.bottom, 24.0)
                        
                        // MARK: - Income Card
                        VStack(alignment: .leading){
                            Text("Income")
                                .font(.system(size:12
                                              ,weight: .medium
                                              ,design: .default
                                             )
                                )
                                .padding(.top, 18.0)
                                .padding(.bottom, 0.000000005)
                            
                            HStack{
                                Text("Rp495.000.000,00")
                                    .font(.system(size:24
                                                  ,weight: .medium
                                                  ,design: .rounded
                                                 )
                                    )
                                
                                Spacer()
                                
                                (Text(up) + Text(" 5,5 %"))
                                    .font(.system(size:11
                                                  ,weight: .semibold
                                                  ,design: .rounded
                                                 )
                                    )
                            }
                            .padding(.trailing)
                            
                            AnimatedChart()
                                .padding(.trailing, 5.0)
                                .padding(.bottom, 18.0)
                            
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        .frame(width: 342
                               ,height: 216
                               ,alignment: .center)
                        
                        // MARK: - Summary Word Card
                        
                        Text("Based on the sales in this month. The product sold and gained 495 million an **increase 5.5%** than last month.")
                            .font(.system(size:11
                                          ,weight: .regular
                                          ,design: .rounded
                                         )
                            )
                            .padding(.top, 18.0)
                            .padding(.horizontal, 10.0)
                            .padding(.bottom, 16.0)
                    }
                    .background(Color.gray)
                    .cornerRadius(8)
                    .frame(width: 358
                           //                         ,height: 324
                    )
                }
                .navigationTitle("Dashboard")
                .navigationBarHidden(true)
            }
        }
    }
    
    // MARK: - Overview Income Analytics Function
    @ViewBuilder
    func AnimatedChart()->some View{
        let max = sampleAnalytics.max { item1, item2 in
            return item2.views > item1.views
        }?.views ?? 0
        
        Chart{
            ForEach(sampleAnalytics){item in
                // MARK: Bar Graph
                BarMark(
                    x: .value("Views", item.views),
                    y: .value("Hour", item.hour, unit: .hour)
                    
                )
            }
        }
        // MARK: Customizing Y-Axis Length
        .frame(
            //                width: 150,
            height: 140
        )
    }
    
    
    struct DashboardOverview_Previews: PreviewProvider {
        static var previews: some View {
            DashboardOverview()
        }
    }
    
}
