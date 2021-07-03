//
//  FlightDetail.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import Foundation

struct FlightDetail: Decodable, Identifiable, Hashable  {
    var id: Int
    var fare: Int
    var stops: Int
    var flightNumber: String?
    var company: String?
    var departure: String?
    var arrival: String?
    var duration: String?
    var source: String?
    var destination: String?
    var sourceCode: String?
    var destinationCode: String?
    var sourceAirport: String?
    var destinationAirport: String?
    var baggage: String?
    var checkin: String?
    var cabin: String?
    var fareType: String?
    var cancellation: String?
}
