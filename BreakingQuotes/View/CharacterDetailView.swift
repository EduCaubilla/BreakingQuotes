    //
    //  CharacterDetailView.swift
    //  BreakingQuotes
    //
    //  Created by Edu Caubilla on 6/3/25.
    //

import SwiftUI

struct CharacterDetailView: View {
    let character : Char

    var body: some View {
        GeometryReader { geo in
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        TabView {
                            ForEach(
                                character.images,
                                id: \.self
                            ) { characterImageUrl in
                                AsyncImage(
                                    url: characterImageUrl
                                ) { imageItem in
                                    imageItem
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                        .tabViewStyle(.page)
                        .frame(
                            width: geo.size.width / 1.2,
                            height: geo.size.height / 1.4
                        )
                        .clipShape(.rect(cornerRadius: 25))
                        
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.largeTitle)
                            
                            Text("Portrayed By : \(character.portrayedBy)")
                                .font(.subheadline)
                            
                            Divider()
                            
                            VStack (alignment: .leading) {
                                if !(character.birthday == "Unknown") {
                                    Text("\(character.name) Character Info")
                                    Text("Born: \(character.birthday)")
                                }
                            }
                            
                            Divider()
                            
                            Text("Occupations:")
                            
                            ForEach(
                                character.occupations,
                                id: \.self
                            ) { occupation in
                                Text("• \(occupation)")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            Text("Nicknames:")
                            
                            if character.aliases.count > 0 {
                                ForEach(
                                    character.aliases,
                                    id: \.self
                                ) { alias in
                                    Text("• \(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
                            }
                            
                            Divider()
                            
                            DisclosureGroup("Status (spoiler alert!): ") {
                                VStack (alignment: .leading) {
                                    Text(character.status)
                                        .font(.title2)
                                    
                                    if let death = character.death {
                                        AsyncImage(
                                            url: death.image
                                        ) { imageItem in
                                            imageItem
                                                .resizable()
                                                .scaledToFit()
                                                .clipShape(
                                                    .rect(cornerRadius: 15)
                                                )
                                                .onAppear {
                                                    proxy
                                                        .scrollTo(
                                                            1,
                                                            anchor: .bottom
                                                        )
                                                }
                                        } placeholder: {
                                            ProgressView()
                                        }
                                            
                                        Text("How: \(death.details)")
                                            
                                        Text(
                                            "Last words: \(death.lastWords)"
                                        )
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .tint(.primary)
                    }
                    .padding(.bottom, 50)
                    .id(1)
                }
                .padding()
                .foregroundStyle(.white)
                .background(.black.opacity(0.4))
                .clipShape(.rect(cornerRadius: 25))
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
        }
    }
}


#Preview {
    CharacterDetailView(character: MainViewModel().character)
}
