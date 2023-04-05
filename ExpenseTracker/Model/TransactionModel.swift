//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Murad Al Wajed on 11/3/2023.
//

import Foundation
import SwiftUIFontIcon
struct Transaction: Identifiable, Codable, Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isExpense: Bool
    var isTransfer: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode{
        if let category = Category.all.first(where: {$0.id == categoryId}){
            return category.icon
        }
        
        return .question
    }
    
    var dateParsed: Date{
        date.datePursed()
    }
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    var month: String{
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
    
}


