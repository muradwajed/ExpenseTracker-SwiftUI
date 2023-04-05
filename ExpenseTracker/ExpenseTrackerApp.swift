//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Murad Al Wajed on 11/3/2023.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
