//
//  ContentView.swift
//  AdditionTutor
//
//  Created by Jacob Tamayo on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    private var emojis = ["🍕", "🍎", "🍏", "🐵", "👽", "🧠", "🧜🏽‍♀️", "🧙🏿‍♂️", "🥷", "🐶", "🐹", "🐣", "🦄", "🐝", "🦉", "🦋", "🦖", "🐙", "🦞", "🐟", "🦔", "🐲", "🌻", "🌍", "🌈", "🍔", "🌮", "🍦", "🍩", "🍪"]

    var body: some View {
        VStack {
            HStack {
                Text("\(firstNumber)")
                Text("+")
                Text("\(secondNumber)")
            }
            .font(.largeTitle)
        }
        .padding()
        // When the app loads, set firstNumber and secondNumber to random ints
        .onAppear {
            firstNumber = Int.random(in: 1...10)
            secondNumber = Int.random(in: 1...10)
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
