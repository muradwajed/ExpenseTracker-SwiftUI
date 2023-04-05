//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Murad Al Wajed on 11/3/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "11/03/23", institution: "Coles", account: "Combank", merchant: "Apple", amount: 10, type: "debit", categoryId: 1, category: "Food", isPending: false, isExpense: false, isTransfer: false, isEdited: false)

let transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)

