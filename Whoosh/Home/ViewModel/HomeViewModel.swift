//
//  HomeViewModel.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {

    private var cancellables = Set<AnyCancellable>()
    @Published var flights = [Flight]()
    
    func getHomeData() {
        NetworkManager.shared.getData(endpoint: .flights, type: Flight.self)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("Error is \(err.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] flightsData in
                self?.flights = flightsData
            }
            .store(in: &cancellables)
        }
}
