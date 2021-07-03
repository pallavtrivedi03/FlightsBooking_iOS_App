//
//  ContentView.swift
//  Whoosh
//
//  Created by Pallav Trivedi on 29/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hexStringToUIColor(hex: "#29272E"))
                    .ignoresSafeArea()
                
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.flights, id: \.self) { value in
                            NavigationLink(destination: FlightDetailView(id: value.id)) {
                                FlightCardView(flight: value)
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("BOM - LHR")
            }
            
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().showsVerticalScrollIndicator = false
            viewModel.getHomeData()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
