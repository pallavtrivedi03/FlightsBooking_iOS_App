//
//  FlightDetailView.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import SwiftUI

struct FlightDetailView: View {
    
    var flightId: Int
    @ObservedObject var viewModel = FlightDetailViewModel()
    init(id: Int) {
      flightId = id
    }
    
    var body: some View {
        ZStack {
            Color(hexStringToUIColor(hex: "#29272E"))
                .ignoresSafeArea()
            
            VStack {
                
                Text("Flight Details")
                    .font(.title)
                    .foregroundColor(.white)
                    
                VStack {
                    HStack {
                        Text(viewModel.details?.company?.appending(" - ") ?? "")
                                    .font(.title2)
                                    .fontWeight(.medium)
                            Text(viewModel.details?.flightNumber ?? "")
                                    .font(.title2)
                                    .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.top, 16)
                    HStack {
                        VStack {
                            Text(viewModel.details?.sourceCode ?? "")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(viewModel.details?.source ?? "")
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
                            Text(viewModel.details?.destinationCode ?? "")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text(viewModel.details?.destination ?? "")
                                .font(.callout)
                        }
                    }
                    
                    HStack {
                        Text(viewModel.details?.sourceAirport ?? "")
                                .font(.footnote)
                        Spacer()
                        Text(viewModel.details?.destinationAirport ?? "")
                                .font(.footnote)
                    }
                    .padding(.top, 16)
                    
                    
                    HStack {
                        VStack {
                            Image(systemName: "airplane.departure")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.black)
                            Text(viewModel.details?.departure ?? "")
                                .font(.title2)
                        }
                        Spacer()
                        VStack {
                            Text(viewModel.details?.duration ?? "")
                                .font(.title2)
                            Text("---------")
                                .font(.title2)
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "airplane.arrival")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30, alignment: .center)
                                .foregroundColor(.black)
                            Text(viewModel.details?.arrival ?? "")
                                .font(.title2)
                        }
                    }
                    .padding(.top, 24)
                    
                    HStack {
                        Text("Baggage")
                            .font(.title2)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    HStack {
                            Group {
                                Text("Checkin")
                                Image(systemName: "suitcase.cart.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20, alignment: .center)
                                    .foregroundColor(.black)
                            }
                            
                        Spacer()
                        
                        Group {
                            Text("Cabin")
                            Image(systemName: "suitcase.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.black)
                        }
                    }
                    HStack {
                        Text(viewModel.details?.checkin ?? "")
                        Spacer()
                        Text(viewModel.details?.cabin ?? "")
                    }
                    Divider()
                        .padding(.top, 20)
                    
                    HStack {
                        Text("\(viewModel.details?.fare ?? 0)")
                            .font(.largeTitle)
                            
                        Spacer()
                        VStack {
                            Text(viewModel.details?.cancellation ?? "")
                                .frame(maxWidth: 100, alignment: .center)
                        }
                        .multilineTextAlignment(.trailing)
                        .frame(alignment: .trailing)
                        
                    }
                   
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image(systemName: "airplane.circle.fill")
                                .font(.title2)
                            
                            Text("BookNow")
                                .font(.title2)
                        }
                        .frame(maxWidth: 200)
                        .frame(height: 50)
                        .background(Color(hexStringToUIColor(hex: "#7f8c8d")))
                        .accentColor(.white)
                        .cornerRadius(8)
                        
                    })
                    
                }
                .padding()
                .frame(width: 350, height: 600, alignment: .center)
                .background(RoundedCorners(tl: 20, tr: 20, bl: 20, br: 20))
                Spacer()
            }
            
        }
        .onAppear {
            viewModel.getFlightDetails(id: flightId)
        }
    }
}


struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
    }
}

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView(id: 0)
    }
}
