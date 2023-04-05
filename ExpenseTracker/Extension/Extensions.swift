//
//  Color+Extension.swift
//  ExpenseTracker
//
//  Created by Murad Al Wajed on 11/3/2023.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("Background")
    static let text = Color("Text")
    static let Icon = Color("Icon")
    static let systemBackground = Color(uiColor: .systemBackground)
    
}

extension DateFormatter{
    static let allNumericUSA: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
}

extension String{
    func datePursed() -> Date{
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        
        return parsedDate
    }
}
