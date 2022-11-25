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
    
    @State
    private var sampleAnalytics: [SiteView] = sample_analytics
    @State
    private var showSheet: Bool = false
    
    @StateObject
    var homeVM: HomeViewModel
    
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
                        .overlay(RoundedRectangle(cornerRadius:4, style: .continuous).stroke(.primary, lineWidth: 2))
                        .sheet(isPresented: $showSheet) {
                            Text("Choose Period of Time")
                                .font(.system(size:13
                                              ,weight: .bold
                                              ,design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.center)
                                .padding([.top, .leading, .trailing], 38.0)
                                .padding(.bottom, 8.0)
                            
                            Text("Select the time you want to see the details of the data or insight about the data.")
                                .font(.system(size:13
                                              ,weight: .regular
                                              ,design: .rounded
                                             )
                                )
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 14.0)
                                .padding(.horizontal, 32.0)
                            
                            Form{
                                Button("Daily") {
                                    
                                }
                                Button("Weekly") {
                                    
                                }
                                Button("Biweekly") {
                                    
                                }
                                Button("Monthly") {
                                    
                                }
                                Button("3 Months") {
                                    
                                }
                                Button("6 Months") {
                                    
                                }
                                Button("All the time") {
                                    
                                }
                                
                                
                                Section{
                                    Button("Custom") {
                                        
                                    }
                                }
                            }
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
                                
                                // MARK: Try1
                                //                                RoundedRectangle(cornerRadius: 4, style: .continuous)
                                //                                    .background(Color.CustomTeal)
                                
                                // MARK: Try2
                                //                                ZStack {
                                //                                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                                //                                        .foregroundColor(Color.CustomTeal)
                                //                                    (Text(up) + Text(" 5,5 %"))
                                //                                        .font(.system(size:18
                                //                                                      ,weight: .semibold
                                //                                                      ,design: .rounded
                                //                                                     )
                                //                                        )
                                //                                        .foregroundColor(.CustomBlack)
                                //                                        .padding(5)
                                //                                }
                                
                                // MARK: Try3
                                (Text(up) + Text(" 5,5 %"))
                                    .font(.system(size:18
                                                  ,weight: .semibold
                                                  ,design: .rounded
                                                 )
                                    )
                                    .background(.primary)
                                    .foregroundColor(.black)
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
                .navigationTitle("Dashboard")
                .navigationBarHidden(true)
            }
        }
        .onAppear() {
            homeVM.getProfile()
            homeVM.getItemSales()
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
    
    
    struct DashboardOverview_Previews: PreviewProvider {
        static var previews: some View {
            DashboardOverview(homeVM: HomeViewModel())
        }
    }
    
}

extension Color {
    static let CustomTeal = Color("CustomTeal")
    static let CustomBlack = Color("CustomBlack")
    static let CustomDarkTeal = Color("CustomDarkTeal")
    static let CustomDarkTeal2 = Color("CustomDarkTeal2")
    static let CustomLightTeal = Color("CustomLightTeal")
    static let CustomOrange = Color("CustomOrange")
}
