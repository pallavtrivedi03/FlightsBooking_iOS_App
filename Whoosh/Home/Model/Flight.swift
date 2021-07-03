//
//  Home.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import Foundation

struct Flight: Decodable, Identifiable, Hashable {
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
}
