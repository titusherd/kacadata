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
