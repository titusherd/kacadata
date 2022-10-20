//
//  DashboardOverview.swift
//  kacadata
//
//  Created by Faizal Hudya Rizfianto on 19/10/22.
//

import SwiftUI

struct DashboardOverview: View {
    let image = Image(systemName: "chevron.down")

    
    var body: some View {
        NavigationView{
            ScrollView{
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
                        HStack{
                            Text("| Overview")
                                
                            Spacer()
                        }
                        .padding()
                        .padding(.bottom, 16.0)
                        
                        VStack{
                            Text("Income")
                                .padding(3)
                                
                            HStack{
                                Text("Rp495.000.000,00")
                                
                                Spacer()
                                
                                (Text("test") + Text("5,5 %"))
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .frame(width: 326, height: 216)
                        HStack{
                            Text("Based on the sales in this month. The product sold and gained 495 million an increase 5.5% than last month.")
                                
                            Spacer()
                        }
                        .padding()
                    }
                    .padding(8)
                    .background(Color.gray)
                    .cornerRadius(20)
                    .frame(width: 358, height: 324)
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
