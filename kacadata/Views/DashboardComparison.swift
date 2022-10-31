//
//  DashboardComparison.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 25/10/22.
//

import SwiftUI
import Charts

struct BundleRecommendation: Identifiable{
    
    let week: String
    let sales: Int
    var id: String {week}
}

let sales : [BundleRecommendation] = [
    .init(week: "Week 1", sales: 170),
    .init(week: "Week 2", sales: 190),
    .init(week: "Week 3", sales: 240),
    .init(week: "Week 4", sales: 210),
]

//Week 1 170, 170
//Week 2 190, 140
//Week 3 240, 160
//Week 4 210, 150

struct WithoutBundleRecommendation: Identifiable{
    
    let week2: String
    let sales2: Int
    var id: String {week2}
}

let sales2 : [WithoutBundleRecommendation] = [
    .init(week2: "Week 1", sales2: 170),
    .init(week2: "Week 2", sales2: 140),
    .init(week2: "Week 3", sales2: 160),
    .init(week2: "Week 4", sales2: 150),
]

struct DashboardComparison: View {
    let image = Image(systemName: "chevron.down")
    let right = Image(systemName: "arrow.right")
    let up = Image(systemName: "arrow.up")
    let down = Image(systemName: "arrow.down")
    
    @State var sampleAnalytics: [SiteView] = sample_analytics
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                // MARK: - Dashboard Comparison
                VStack{
                    HStack{
                        Text("Result")
                            .font(.system(size:36
                                          ,weight: .bold
                                          ,design: .rounded
                                         )
                            )
                        
                        Spacer()
                    }
                    .padding([.top, .leading, .trailing])
                    
                    VStack(alignment: .center){
                        // MARK: Comparison Card
                        HStack(spacing: 5){
                            Text("| Comparison")
                                .font(.system(size:16,
                                              weight: .semibold,
                                              design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .padding([.top, .leading, .trailing])
                        
                        VStack(alignment: .leading){
                            AnimatedComparationLineChart()
                                .padding([.top, .trailing], 5.0)
                                .padding(.vertical, 20.0)
                            
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        //                        .background(Color.CustomBlack)
                        .background(Color.CustomDarkTeal)
                        .cornerRadius(8)
                        .frame(width: 326
                               ,height: 190
                               ,alignment: .center)
                        .shadow(radius: 3)
                        
                        // MARK: Summary Word Card
                        
                        HStack{
                            Text("Based on the sales in October, with Bundle Rec. the income sold 160 items, an **increase 15%** than September without Bundle Rec.")
                                .font(.system(size:11
                                              ,weight: .regular
                                              ,design: .rounded
                                             )
                                )
                                .padding(.top, 4.0)
                                .padding(.leading, 17.0)
                                .padding(.bottom, 16.0)
                            
                            NavigationLink(destination: ComparisonDetail()){
                            label: do {(Text("Detail  ") + Text(right))
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
                            }
                        }
                    }
                    .background(Color.CustomLightTeal)
                    .cornerRadius(8)
                    .frame(width: 358
                    )
                }
                .navigationTitle("Result")
                .navigationBarHidden(true)
                
                // MARK: - Dashboard Overview
                
                VStack{
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
                        .padding(.bottom, 20.0)
                        
                        // MARK: - Income Card
                        VStack(alignment: .leading){
                            Text("Income")
                                .font(.system(size:12
                                              ,weight: .medium
                                              ,design: .default
                                             )
                                )
                                .foregroundColor(.white)
                                .padding(.top, 18.0)
                                .padding(.bottom, -2.0)
                            
                            HStack{
                                Text("Rp495.000.000,00")
                                    .font(.system(size:18
                                                  ,weight: .medium
                                                  ,design: .rounded
                                                 )
                                          
                                    )
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                // MARK: Try3
                                (Text(up) + Text(" 5,5 %"))
                                    .font(.system(size:18
                                                  ,weight: .semibold
                                                  ,design: .rounded
                                                 )
                                    )
                                    .background(Color.CustomTeal)
                                    .foregroundColor(.CustomBlack)
                                    .padding(5)
                                    .cornerRadius(14)
                                
                            }
                            .padding(.trailing)
                            .padding(.bottom, 14.0)
                            
                            AnimatedBarChart()
                                .padding(.trailing, 5.0)
                                .padding(.bottom, 20.0)
                            
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        .background(Color.CustomDarkTeal)
                        .cornerRadius(8)
                        .frame(width: 325
                               ,height: 216
                               ,alignment: .center)
                        .shadow(radius: 3)

                        
                        // MARK: - Summary Word Card
                        
                        Text("Based on the sales in this month. The product sold and gained 495 million an **increase 5.5%** than last month.")
                            .font(.system(size:11
                                          ,weight: .regular
                                          ,design: .rounded
                                         )
                            )
                            .padding(.top, 25.0)
                            .padding(.horizontal, 10.0)
                            .padding(.bottom, 16.0)
                    }
                    .background(Color.CustomLightTeal)
                    .cornerRadius(8)
                    .frame(width: 358
                    )
                    
                }
                .padding(.top, 5.0)
                
                // MARK: - Dashboard Overview
                
                VStack{
                    VStack(alignment: .center){
                        // MARK: - Overview Card
                        HStack(spacing: 5){
                            Text("| Current Bundle")
                                .font(.system(size:16,
                                              weight: .semibold,
                                              design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                        }
                        .padding([.top, .leading, .trailing])

                        // MARK: - Summary Word Card
                        
                        (Text("You’ve scheduled to create bundle package for item \n")
                        +
                        Text("**Ayam Bakar Taliwang**")
                            .underline()
                        +
                        Text(" and ")
                        +
                        Text("**Kue Putu**")
                            .underline()
                        +
                        Text(" for 30 days start from \n")
                        +
                        Text("**21 October 2022**")
                            .underline()
                        +
                        Text(" until ")
                        +
                         Text("**20 November 2022**")
                             .underline())
                            .font(.system(size:12
                                          ,weight: .regular
                                          ,design: .rounded
                                         )
                            )
                            .padding(.top, 3.0)
                            .padding(.horizontal, 16.0)
                            .padding(.bottom, 14)
                        
                        NavigationLink(destination: Text("This is a page for Change your plan"), label: {
                            Text("Change Your Plan")
                                .frame(width: 326,
                                       height: 48,
                                       alignment: .center)
                                .background(Color.CustomLightGray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .font(.system(size: 14,
                                              weight: .semibold,
                                              design: .rounded))
                            }
                        )
                        .padding(.bottom)
                    }
                    .background(Color.CustomLightTeal)
                    .cornerRadius(8)
                    .frame(width: 358
                    )
                }
                .padding(.top, 5.0)

            }
        }
    }
    
    // MARK: - Overview Income Analytics Function
    @ViewBuilder
    func AnimatedBarChart()->some View{
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
        .foregroundColor(Color("CustomTeal"))
        .frame(
            height: 140
        )
    }
    
    // MARK: - Comparison Analytics Function
    @ViewBuilder
    func AnimatedLineChart()->some View{
        let max = sampleAnalytics.max { item1, item2 in
            return item2.views > item1.views
        }?.views ?? 0
        
        Chart{
            ForEach(sampleAnalytics){item in
                // MARK: Bar Graph
                LineMark(
                    x: .value("Hour", item.hour, unit: .hour),
                    y: .value("Views", item.views)
                )
                .interpolationMethod(.catmullRom)
//                .foregroundStyle(by: .value((), ))
            }
            ForEach(sampleAnalytics){item in
                // MARK: Bar Graph
                LineMark(
                    x: .value("Hour", item.hour, unit: .hour),
                    y: .value("Views", item.views)
                )
                .interpolationMethod(.catmullRom)
            }
        }
        
        // MARK: Customizing Y-Axis Length
        .foregroundColor(Color("CustomTeal"))
        .frame(
            height: 140
        )
    }
    
    // MARK: - Comparison Analytics 2 Function
    @ViewBuilder
    func AnimatedComparationLineChart()->some View{
        
        Chart{
            ForEach(sales){i in
                LineMark(
                    x: .value("week", i.week),
                    y: .value("sales", i.sales)
                )
                .interpolationMethod(.catmullRom)
//                .foregroundStyle(by: .value((), ))
            }
            ForEach(sales2){i in
                LineMark(
                    x: .value("week2", i.week2),
                    y: .value("sales2", i.sales2)
                )
                .interpolationMethod(.catmullRom)
            }
        }
        
        // MARK: Customizing Y-Axis Length
        .foregroundColor(Color("CustomTeal"))
        .frame(
            height: 140
        )
    }
    
    struct DashboardComparison_Previews: PreviewProvider {
        static var previews: some View {
            DashboardComparison()
        }
    }
}

extension Color {
    static let CustomLightGray = Color("CustomLightGray")
    static let LightGray = Color("lightgray")
}
