//
//  QuoteView.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 6/3/25.
//

import SwiftUI

struct QuoteView: View {
    let quote : Quote
    let character : Char

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center) {
                Text("\"\(quote.quote)\"")
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 25))
                    .padding(.horizontal)
                    .padding(.bottom, 5)
                
                
                ZStack (alignment: .bottom) {
                    AsyncImage(url: character.images.randomElement()) { imageItem in
                        imageItem
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.2)
                    
                    Text(quote.character)
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                }
                .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.2)
                .clipShape(.rect(cornerRadius: 50))
            }
            .padding(.horizontal)
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    QuoteView(quote: MainViewModel().quote, character: MainViewModel().character)
}
