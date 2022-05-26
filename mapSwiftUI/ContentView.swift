//
//  ContentView.swift
//  mapSwiftUI
//
//  Created by BJIT on 23/5/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel() //access to ContentViewModel class
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear{
                viewModel.checkIfLocServiceEnabled()
            }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

