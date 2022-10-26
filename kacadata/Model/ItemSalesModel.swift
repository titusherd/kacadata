//
//  ItemSales.swift
//  kacadata
//
//  Created by Ridho Saputra on 17/10/22.
//

import Foundation

struct ItemSalesModel: Codable {
    var name: String
    var sku: String
    var categoryName: String
    var itemSold: Int
    var itemRefunded: Int
    var grossSales: Int
    var discount: Int
    var refund: Int
    var netSales: Int
    var grossProfit: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case sku
        case categoryName = "category_name"
        case itemSold = "item_sold"
        case itemRefunded = "item_refunded"
        case grossSales = "gross_sales"
        case discount
        case refund
        case netSales = "net_sales"
        case grossProfit = "gross_profit"
    }
}
