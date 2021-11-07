//
//  CastVM.swift
//  EpicTest
//
//  Created by Himash Nadeeshan on 2021-11-05.
//

import Foundation
import Combine

class CastVM: ObservableObject, CastService {
    
    @Published var castList : [Cast] = []
    @Published var isLoading = true
    
    var networkManager: APIService
    var cancellables = Set<AnyCancellable>()
    
    init(networkManager: APIService = NetworkManager()) {
        self.networkManager = networkManager
        self.getCastList(limit: 5)
    }
    
    func getCastList(limit: Int) {
        let cancellable = self.getCastList(limit: 5)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (cast) in
                self.castList = cast
                self.isLoading = false
        }
        cancellables.insert(cancellable)
    }
}
