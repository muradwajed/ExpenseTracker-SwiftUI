//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Murad Al Wajed on 11/3/2023.
//

import SwiftUI
import SwiftUIFontIcon
import SwiftUICharts


struct ContentView: View {
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2, 8, 2, 4, 6, 12, 9, 2]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK: - Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: - Chart
                    LineChartView(data: demoData, title: "Recent Transaction", form: ChartForm.large)
                        
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //MARK: - Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        
        return transactionListVM
    }()
    
      
    static var previews: some View {
        Group{
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
        
    }
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category {
    //MARK :- Main Category
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    //MARK :- Sub-Category
    //Category (id) numbers follows the mainCateogoryId number
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: 9)
}

//MARK :- advangage of separating is that we can call them independently
extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    //MARK :- combine both of the catigores into one Array
    static let all:[Category] = categories + subCategories
}
