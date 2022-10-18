//
//  Checkout.swift
//  kacadata
//
//  Created by Ridho Saputra on 17/10/22.
//

import Foundation

struct Checkout: Codable {
    var id: Int
    var createdAt: String
    var updatedAt: String
    var itemDiscount: Int
    var grossSales: Double
    var itemName: String
    var itemId: Int
    var salesTypeName: String
    var itemVariantName: String
    var itemVariantId: Int
    var itemPriceLibrary: Double
    var categoryName: String
    var netSales: Double
    var sku: String
    var quantity: Int
    var price: Double
    var itemPriceDiscount: Double
    var itemPrice: Double
    var totalPrice: Double
    var categoryId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case itemDiscount = "item_discount"
        case grossSales = "gross_sales"
        case itemName = "item_name"
        case itemId = "item_id"
        case salesTypeName = "sales_type_name"
        case itemVariantName = "item_variant_name"
        case itemVariantId = "item_variant_id"
        case itemPriceLibrary = "item_price_library"
        case categoryName = "category_name"
        case netSales = "net_sales"
        case sku
        case quantity
        case price
        case itemPriceDiscount = "item_price_discount"
        case itemPrice = "item_price"
        case totalPrice = "total_price"
        case categoryId = "category_id"
    }
}
