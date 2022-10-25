//
//  DashboardComparison.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 25/10/22.
//

import SwiftUI
import Charts

struct DashboardComparison: View {
    let image = Image(systemName: "chevron.down")
    let right = Image(systemName: "arrow.right")
    
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
                    .padding(.bottom, 25.0)
                    
                    VStack(alignment: .center){
                        // MARK: - Overview Card
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
                        
                        // MARK: - Income Card
                        VStack(alignment: .leading){
                            AnimatedChart()
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
                        
                        // MARK: - Summary Word Card
                        
                        HStack{
                            Text("Based on the sales in this month. The product sold and gained 495 million an **increase 15%** than last month.")
                                .font(.system(size:11
                                              ,weight: .regular
                                              ,design: .rounded
                                             )
                                )
                                .padding(.top, 18.0)
                                .padding(.leading, 13.0)
                                .padding(.bottom, 16.0)
                            
                            Button(){
                                
                            }  label: {(Text("Detail  ") + Text(right))
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
                    .background(Color.CustomLightTeal)
                    .cornerRadius(8)
                    .frame(width: 358
                           //                           ,height: 326
                    )
                }
                .navigationTitle("Dashboard")
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
                                .padding(.bottom, 0.000000005)
                            
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
                                (Text(right) + Text(" 5,5 %"))
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
                            
                            AnimatedChart()
                                .padding(.trailing, 5.0)
                                .padding(.bottom, 20.0)
                            
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        //                        .background(Color.CustomBlack)
                        .background(Color.CustomDarkTeal)
                        .cornerRadius(8)
                        .frame(width: 325
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
                    .background(Color.CustomLightTeal)
                    .cornerRadius(8)
                    .frame(width: 358
                           //                                                    ,height: 324
                    )
                }
                .padding(.top, 5.0)
                
                // MARK: - Dashboard Overview
                
                VStack{
                    VStack(alignment: .center){
                        // MARK: - Overview Card
                        HStack(spacing: 5){
                            Text("| Ongoing Bundling")
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
                        
                        (Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus id tincidunt neque, quis tempor urna.  Praesent eget metus sapien. Aenean ac tortor ac tellus rutrum sollicitudin. ")
                        +
                        Text("**Ayam Bakar Taliwang**")
                            .underline()
                        +
                        Text(" felis, accumsan at neque vehicula, auctor vehicula libero. Donec facilisis sem nec orci ")
                        +
                        Text("**Kue Putu**")
                            .underline()
                        +
                        Text(" ornare."))
                            .font(.system(size:11
                                          ,weight: .regular
                                          ,design: .rounded
                                         )
                            )
                            .padding(.top, 1.0)
                            .padding(.horizontal, 16.0)
                            .padding(.bottom, 6)
                        
                        NavigationLink(destination: Text("This is page for MOKA Sync"), label: {
                            Text("Change Your Schedule")
                                .frame(width: 326,
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
                    }
                    .background(Color.CustomLightTeal)
                    .cornerRadius(8)
                    .frame(width: 358
                           //                                                    ,height: 324
                    )
                }
                .padding(.top, 5.0)

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
                    //                    y: .value("Hour", item.hour, unit: .hour)
                    
                )
            }
        }
        
        // MARK: Customizing Y-Axis Length
        .foregroundColor(Color("CustomTeal"))
        .frame(
            //                width: 150,
            height: 140
        )
    }
    
    struct DashboardComparison_Previews: PreviewProvider {
        static var previews: some View {
            DashboardComparison()
        }
    }
}
