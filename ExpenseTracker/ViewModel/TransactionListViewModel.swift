//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Murad Al Wajed on 11/3/2023.
//

import Foundation
import Combine

typealias TransactionGroup = [String : [Transaction]]

final class TransactionListViewModel: ObservableObject{
    @Published var transactions: [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        getTransactions()
    }
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{ (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink{ completion in
                switch completion {
                    case .failure(let error):
                        print("Error fetching transaction \(error)")
                    case .finished:
                        print("Finished fetching trasaction")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)
        
    }
    
    func groupTransactionByMonth() -> TransactionGroup{
        guard !transactions.isEmpty else { return [:]}
        
        let groupTransactions = TransactionGroup(grouping: transactions){ $0.month }
        return groupTransactions
    }
    
}
