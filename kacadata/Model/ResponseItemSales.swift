//
//  ResponseItemSales.swift
//  kacadata
//
//  Created by Ridho Saputra on 25/11/22.
//

import Foundation

struct ResponseItemSales: Codable {
    var itemSales: [ItemSalesModel] = []
    var totalItemSold: Int = 0
    var totalGrossSales: Int = 0
    var totalDiscounts: Int = 0
    var totalNetSales: Int = 0
    var totalRefund: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case itemSales = "item_sales"
        case totalItemSold = "total_item_sold"
        case totalGrossSales = "total_gross_sales"
        case totalDiscounts = "total_discounts"
        case totalNetSales = "total_net_sales"
        case totalRefund = "total_refund"
    }
}
