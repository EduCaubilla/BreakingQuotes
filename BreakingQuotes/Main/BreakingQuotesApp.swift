//
//  BreakingQuotesApp.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 5/3/25.
//

import SwiftUI

@main
struct BreakingQuotesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


/**
 - Auto fetch on start ✅
 - First random image no the first of the list ✅
 - Fetch random character
 
 characters/random -> check if it's from the correct show
 
 -  random quote from character
 --> let fetchURL = quoteURL.appending(queryItems: [URLQueryItem(name: "character", value: name)])
 
 */
