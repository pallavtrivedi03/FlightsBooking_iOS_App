//
//  FlightDetailViewModel.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import Foundation
import Combine

class FlightDetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var details: FlightDetail?
    
    func getFlightDetails(id: Int) {
        NetworkManager.shared.getData(endpoint: .details, id: id,type: FlightDetail.self)
            .sink { _ in
            } receiveValue: { [weak self] flightDetails in
                self?.details = flightDetails.first
            }
            .store(in: &cancellables)
    }
}
