//
//  ComparisonDetail.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 25/10/22.
//

import SwiftUI
import Charts

struct ComparisonDetail: View {
    let image = Image(systemName: "chevron.down")
    let right = Image(systemName: "arrow.right")
    let up = Image(systemName: "arrow.up")
    let down = Image(systemName: "arrow.down")
    
    @State var sampleAnalytics: [SiteView] = sample_analytics
    @State private var showSheet: Bool = false
    
    var body: some View {
        ScrollView{
            // MARK: - Dashboard Comparison
            VStack{
                HStack{
                }
                .padding(.bottom, 1.0)
                
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
                    .padding(.horizontal)
                    .padding(.top, 16.0)
                    .padding(.bottom, 10.0)
                    
                    // MARK: - Bundling Item
                    VStack{
                        VStack(alignment: .leading){
                            Text("Bundling Item")
                                .font(.system(size:12
                                              ,weight: .medium
                                              ,design: .default
                                             )
                                )
                                .foregroundColor(.white)
                                .padding(.top, 14.0)
//                                .padding(.bottom, 0.000000005)
                            
                            Text("Sold 50 Bundle")
                                .font(.system(size:24
                                              ,weight: .medium
                                              ,design: .rounded
                                             )
                                      
                                )
                                .foregroundColor(.CustomTeal)
                                .padding(.top, 1.0)
                                .padding(.bottom, 1.0)
                            
                            Text("Based on the sales in this week. you've sold **50 bundle!**")
                                .font(.system(size:12
                                              ,weight: .medium
                                              ,design: .default
                                             )
                                )
                                .foregroundColor(.white)
                                .padding(.top, 4.0)
                                .padding(.bottom, 14.0)
                            
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 47.0)
                        //                        .background(Color.CustomBlack)
                        .background(Color.CustomDarkTeal)
                        .cornerRadius(8)
                        .frame(alignment: .center)
                    }
                    .padding(.bottom, 4.0)
                    
                    // MARK: - Single Item
                    VStack{
                        VStack(alignment: .leading){
                            Text("Single Item")
                                .font(.system(size:12
                                              ,weight: .medium
                                              ,design: .default
                                             )
                                )
                                .foregroundColor(.white)
                                .padding(.top, 14.0)
                                .padding(.bottom, 0.000000005)
                            
                            HStack{
                                Text("Ayam Bakar Taliwang")
                                    .font(.system(size:18
                                                  ,weight: .medium
                                                  ,design: .rounded
                                                 )
                                          
                                    )
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                // MARK: Try3
                                (Text(up) + Text(" 10,5 %"))
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
                            
                            HStack{
                                Text("Kue Putu")
                                    .font(.system(size:18
                                                  ,weight: .medium
                                                  ,design: .rounded
                                                 )
                                          
                                    )
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                // MARK: Try3
                                (Text(up) + Text(" 8,5 %"))
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
                                .padding([.top, .trailing], 10.0)
                                .padding(.bottom, 20.0)
                            
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
                                .font(.system(size:11
                                              ,weight: .regular
                                              ,design: .rounded
                                             )
                                )
                                .foregroundColor(.white)
                                .padding(.trailing, 8.0)
                                .padding(.bottom, 16.0)
                            
                        }
                        .padding(.bottom, 14.0)
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        //                        .background(Color.CustomBlack)
                        .background(Color.CustomDarkTeal)
                        .cornerRadius(8)
                        .frame(width: 326, alignment: .center)
                    }
                    .padding(.bottom, 4.0)

                    
                    // MARK: - Contribute to Income
                    VStack{
                        VStack(alignment: .leading){
                            Text("Contribute to Income")
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
                                    .font(.system(size:24
                                                  ,weight: .medium
                                                  ,design: .rounded
                                                 )
                                          
                                    )
                                    .foregroundColor(.white)
                                
                            }
                            .padding(.trailing)
                            .padding(.bottom, 14.0)
                            
                            AnimatedChart()
                                .padding(.trailing, 5.0)
                                .padding(.bottom, 8.0)
                            
                            Text("Based on the sales in this week. Your Bundle promotion \nhas contribute **10%** from your overall income.")
                                .font(.system(size:11
                                              ,weight: .regular
                                              ,design: .rounded
                                             )
                                )
                                .foregroundColor(.white)
                                .padding(.trailing, 8.0)
                                .padding(.bottom, 16.0)
                            
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        //                        .background(Color.CustomBlack)
                        .background(Color.CustomDarkTeal)
                        .cornerRadius(8)
                        .frame(width: 326, alignment: .center)
                    }
                    .padding(.bottom, 4.0)

                }
                .padding(.bottom)
                .background(Color.CustomLightTeal)
                .cornerRadius(8)
                .frame(width: 358
                )
                
            }
            .navigationTitle("Comparison Detail")
            
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
    struct ComparisonDetail_Previews: PreviewProvider {
        static var previews: some View {
            ComparisonDetail()
        }
    }
}


