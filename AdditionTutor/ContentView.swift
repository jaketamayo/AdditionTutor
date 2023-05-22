//
//  ContentView.swift
//  AdditionTutor
//
//  Created by Jacob Tamayo on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    // firstNumber and secondNumber is used to generate a random number from 1 to 10
    //  - these numbers will be used to assign a random repeated emoji
    @State private var firstNumber = Int.random(in: 1...10)
    @State private var secondNumber = Int.random(in: 1...10)
    @State private var firstNumberEmojis = "" // holds the first number of randomly selected emojis
    @State private var secondNumberEmojis = "" // // holds the second number of randomly selected emojis

    private var emojis = ["🍕", "🍎", "🍏", "🐵", "👽", "🧠", "🧜🏽‍♀️", "🧙🏿‍♂️", "🥷", "🐶", "🐹", "🐣", "🦄", "🐝", "🦉", "🦋", "🦖", "🐙", "🦞", "🐟", "🦔", "🐲", "🌻", "🌍", "🌈", "🍔", "🌮", "🍦", "🍩", "🍪"]
    

    var body: some View {
        VStack {
            Group {
                Text("\(firstNumberEmojis)")
                Text("+")
                Text("\(secondNumberEmojis)")
            }
            .font(.system(size: 80))
            
            Spacer()
            
            HStack {
                Text("\(firstNumber)")
                Text("+")
                Text("\(secondNumber)")
            }
            .font(.largeTitle)
        }
        .padding()
        
        .onAppear {
            // When the screen appears, set the firstNumberEmojis and secondNumberEmojis to the function randomEmojiGenerator passing in the random firstNumber and secondNumber properties.
            firstNumberEmojis = randomEmojiGenerator(number: firstNumber)
            secondNumberEmojis = randomEmojiGenerator(number: secondNumber)
        }
    }
    
    // This function needs to return a string becuase it will be used with firstNumberEmojis and secondNumberEmojis which are strings
    func randomEmojiGenerator(number: Int) -> String {
        var emojiString = ""
        let randomEmoji = emojis.randomElement()!
        for _ in 1...number {
            emojiString.append(randomEmoji)
        }
        return emojiString
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
