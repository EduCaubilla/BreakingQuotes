//
//  EpisodeView.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 5/3/25.
//

import SwiftUI

struct EpisodeView: View {
    let episode : Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(episode.title)
                .font(.largeTitle)
            
            Text(episode.seasonEpisode)
                .font(.title2)
            
            AsyncImage(url: episode.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 15))
            } placeholder: {
                ProgressView()
            }
            
            Text(episode.synopsis)
                .font(.title3)
                .minimumScaleFactor(0.5)
                .padding(.bottom)
            
            Text("Written By: \(episode.writtenBy)")
            
            Text("Directed By: \(episode.directedBy)")
            
            Text("Aired: \(episode.airDate)")
                
        }
        .padding()
        .foregroundStyle(.white)
        .background(.black.opacity(0.4))
        .clipShape(.rect(cornerRadius: 25))
        .padding(.horizontal)
    }
}

#Preview {
    EpisodeView(episode: MainViewModel().episode)
}
