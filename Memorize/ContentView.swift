//
//  ContentView.swift
//  Memorize
//
//  Created by Sean Peng on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    
    let vehicles = ["🚂", "🚌", "✈️", "🚀", "🚗", "🚕", "🚙", "🚎", "🏎", "🚓", "🛳",
                    "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🚲", "🛺", "🛸"]
    let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯",
                   "🦁", "🐮", "🐷", "🐧", "🐦", "🐤", "🦆", "🦖"]
    let sports = ["⚽️", "🏀", "🏈", "⚾️", "🏐", "🎾", "🏉", "🥏", "🎱", "🪀", "🏓",
                  "🏸", "🏒", "🏑", "🥍", "🥊", "🛼", "🏹"]
    
    @State var emojis: [String]
    @State var emojiCount = 6
    
    init() {
        emojis = vehicles
    }
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                vehicleTheme
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal )
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emojiCount < vehicles.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var vehicleTheme: some View {
        Button {
            emojis = vehicles
        } label: {
            VStack{
                Image(systemName: "car.fill").font(.largeTitle)
                Text("Vehicles").font(.body)
            }
        }
    }
}
struct CardView: View {
    var content: String
    @State  var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
