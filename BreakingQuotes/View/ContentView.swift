//
//  ContentView.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 5/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab (Constants.BreakingBad, systemImage: "tortoise") {
                MainView(show: Constants.BreakingBad)
            }
            
            Tab (Constants.BetterCallSaul, systemImage: "briefcase") {
                MainView(show: Constants.BetterCallSaul)
            }
            
            Tab (Constants.ElCamino, systemImage: "car") {
                MainView(show: Constants.ElCamino)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
