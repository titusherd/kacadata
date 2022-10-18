//
//  Transaction.swift
//  kacadata
//
//  Created by Ridho Saputra on 17/10/22.
//

import Foundation

struct Transaction: Codable {
    var id: String
    var paymentNo: String
    var createdAt: String
    var updatedAt: String
    var totalCollected: Double
    var totalItemPriceAmount: Int
    var name: String
    var paymentType: String
    var paymentTypeLabel: String
    var customerId: String?
    var discount: Double
    var subtotal: Double
    var gratuities: Double
    var tendered: Double
    var change: Double
    var transactionDate: String
    var transactionTime: String
    var collectedBy: String
    var outletId: Int
    var checkouts: [Checkout]
    
    enum CodingKeys: String, CodingKey {
        case id
        case paymentNo = "payment_no"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case totalCollected = "total_collected"
        case totalItemPriceAmount = "total_item_price_amount"
        case name
        case paymentType = "payment_type"
        case paymentTypeLabel = "payment_type_label"
        case customerId = "customer_id"
        case discount
        case subtotal
        case gratuities
        case tendered
        case change
        case transactionDate = "transaction_date"
        case transactionTime = "transaction_time"
        case collectedBy = "collected_by"
        case outletId = "outlet_id"
        case checkouts
    }
}
