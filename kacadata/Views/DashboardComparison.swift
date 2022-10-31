//
//  DashboardComparison.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 25/10/22.
//

import SwiftUI
import Charts

struct BundleRecommendation: Identifiable {
    
    var report: Int
    var method: String
    var week: String
    var sales: Int
    var id: Int {report}
    
    init(report: Int, method: String, week: String, sales: Int){
        self.report = report
        self.method = method
        self.week = week
        self.sales = sales
    }
}

var sales : [BundleRecommendation] = [
    BundleRecommendation(report:1,method: "With Bundle Recommend", week: "Week 1", sales: 170),
    BundleRecommendation(report:2,method: "Without Bundle Recommend", week: "Week 1", sales: 170),
    BundleRecommendation(report:3,method: "With Bundle Recommend", week: "Week 2", sales: 190),
    BundleRecommendation(report:4,method: "Without Bundle Recommend", week: "Week 2", sales: 140),
    BundleRecommendation(report:5,method: "With Bundle Recommend", week: "Week 3", sales: 240),
    BundleRecommendation(report:6,method: "Without Bundle Recommend", week: "Week 3", sales: 160),
    BundleRecommendation(report:7,method: "With Bundle Recommend", week: "Week 4", sales: 210),
    BundleRecommendation(report:8,method: "Without Bundle Recommend", week: "Week 4", sales: 150)
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
    //    @ViewBuilder
    func AnimatedComparationLineChart()->some View{
        
        Chart(sales) {
            LineMark(
                x: .value("week", $0.week),
                y: .value("sales", $0.sales)
            )
            .interpolationMethod(.catmullRom)
            .foregroundStyle(by: .value("method", $0.method))
        }
        .chartForegroundStyleScale(["With Bundle Recommend": Color.CustomTeal, "Without Bundle Recommend": Color.CustomLightOrange])
        
        
        // MARK: Customizing Y-Axis Length
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
    static let CustomLightOrange = Color("CustomLightOrange")

}
