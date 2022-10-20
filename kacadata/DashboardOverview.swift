//
//  DashboardOverview.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 19/10/22.
//

import SwiftUI

struct DashboardOverview: View {
    let image = Image(systemName: "chevron.down")
    let up = Image(systemName: "arrow.up")
    let down = Image(systemName: "arrow.down")
    
    var body: some View {
        NavigationView{
            ScrollView{
                // MARK: - Dashboard Heading
                VStack{
                    HStack{
                        Text("Dashboard")
                            .font(.system(size:36,
                                          weight: .bold,
                                          design: .rounded))
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            (Text("Monthly  ") + Text(image))
                                .frame(width: 81,
                                       height: 28
                                )
                                .font(.system(size:11,
                                              weight: .semibold,
                                              design: .rounded))
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        })
                    }
                    .padding()
                    .padding(.bottom, 26.0)
                    
                    VStack(alignment: .leading){
                        // MARK: - Overview Card
                        HStack{
                            Text("| Overview")
                                
                            Spacer()
                        }
                        .padding()
                        .padding(.bottom, 16.0)
                        
                        // MARK: - Income Card
                        VStack(alignment: .leading){
                            Text("Income")
                                .padding(3)
                                
                            HStack{
                                Text("Rp495.000.000,00")
                                    .font(.system(size:24,
                                                  weight: .medium,
                                                  design: .rounded))
                                
                                Spacer()
                                
                                (Text(up) + Text(" 5,5 %"))
                                    .font(.system(size:11,
                                                  weight: .semibold,
                                                  design: .rounded))
                            }
                        }
                        .padding(.leading, 25.0)
                        .padding(.trailing, 12.0)
                        .background(Color.white)
                        .cornerRadius(8)
                        .frame(width: 342,height: 216,
                               alignment: .center)
                        
                        // MARK: - Summary Word Card
                        HStack{
                            Text("Based on the sales in this month. The product sold and gained 495 million an **increase 5.5%** than last month.")
                        }
                        .padding()
                    }
                    .padding(8)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .frame(width: 358,
                           height: 324)
                }
                .navigationTitle("Dashboard")
                .navigationBarHidden(true)
                
            }
        }
    }
    
    struct DashboardOverview_Previews: PreviewProvider {
        static var previews: some View {
            DashboardOverview()
        }
    }
    
}
