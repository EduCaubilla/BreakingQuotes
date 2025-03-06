//
//  QuoteView.swift
//  BreakingQuotes
//
//  Created by Edu Caubilla on 5/3/25.
//

import SwiftUI

struct MainView: View {
    let vm = MainViewModel()
    let show: String
    
    @State var showCharacterInfo = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(show.removeCaseAndSpace())
                    .resizable()
                    .frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 65)
                        
                        switch vm.status {
                            
                        case .notStarted:
                            EmptyView()
                            
                        case .fetching:
                            ProgressView()
                            
                        case .successQuote:
                            QuoteView(quote: vm.quote, character: vm.character)
                                .onTapGesture {
                                    showCharacterInfo.toggle()
                                }
                            
                        case .successEpisode:
                            EpisodeView(episode: vm.episode)
                            
                        case .successCharacter:
                            CharacterDetailView(character: vm.character)

                        case .failed(let error):
                            Text(error.localizedDescription)
                        }
                    }

                    VStack {
                        Button {
                            Task {
                                await vm.getQuoteData(for: show)
                            }
                        } label: {
                            Text ("Get Random Quote")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .frame(width: geo.size.width - 100)
                                .padding(10)
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 15))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        }
                        .padding(.bottom, 2)
                        
                        Button {
                            Task {
                                await vm.getEpisode(for: show)
                            }
                        } label: {
                            Text ("Get Random Episode")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .frame(width: geo.size.width - 100)
                                .padding(10)
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 15))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                        }
                        .padding(.bottom, 2)
                        
                        Button {
                            Task {
                                await vm.getCharacterRandom(for: show)
                            }
                        } label: {
                            Text ("Get Random Character")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .frame(width: geo.size.width - 100)
                                .padding(10)
                                .background(Color("\(show.removeSpaces())Button"))
                                .clipShape(.rect(cornerRadius: 15))
                                .shadow(color: Color("\(show.removeSpaces())Shadow"), radius: 2)
                                
                        }
                        
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer(minLength: 100)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .task {
                    await vm.getQuoteData(for: Constants.BreakingBad)
                }
        }
        .ignoresSafeArea()
        .toolbarBackgroundVisibility(.visible, for: .tabBar)
        .sheet(isPresented: $showCharacterInfo) {
            CharacterView(character: vm.character, show: show)
        }
    }
}

#Preview {
    MainView(show: Constants.BreakingBad)
        .preferredColorScheme(.dark)
}
