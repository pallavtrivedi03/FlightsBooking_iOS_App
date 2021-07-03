//
//  FlightCardView.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import Foundation
import SwiftUI

struct FlightCardView: View {
    let flight: Flight
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#B4D2C8"))]), startPoint: .top, endPoint: .bottom))
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "airplane")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black)
                        Text(flight.flightNumber ?? "")
                    }
                    
                    Spacer()
                    Text(flight.company ?? "")
                        .fontWeight(.bold)
                }
                HStack {
                    VStack {
                        Text(flight.sourceCode ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(flight.source ?? "")
                            .font(.callout)
                    }
                    Spacer()
                    Image(systemName: "airplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(.black)
                    Spacer()
                    VStack {
                        Text(flight.destinationCode ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(flight.destination ?? "")
                            .font(.callout)
                    }
                }
                HStack {
                    Group {
                        Image(systemName: "airplane.departure")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black)
                        Text(flight.departure ?? "")
                    }
                    Spacer()
                    Group {
                        Image(systemName: "airplane.arrival")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                            .foregroundColor(.black)
                        Text(flight.arrival ?? "")
                    }
                }
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .frame(height: 1)
                Spacer()
                HStack {
                    Text("₹ \(flight.fare)")
                        .font(.title2)
                        .fontWeight(.medium)
                    Spacer()
                    Text("Book")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding()
        }
        .frame(maxWidth: 350, minHeight: 220,maxHeight: 220, alignment: .center)
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}
