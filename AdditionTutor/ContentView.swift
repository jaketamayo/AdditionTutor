//
//  ContentView.swift
//  AdditionTutor
//
//  Created by Jacob Tamayo on 5/22/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    // firstNumber and secondNumber is used to generate a random number from 1 to 10
    //  - these numbers will be used to assign a random repeated emoji
    @State private var firstNumber = Int.random(in: 1...10)
    @State private var secondNumber = Int.random(in: 1...10)
    @State private var firstNumberEmojis = "" // holds the first number of randomly selected emojis
    @State private var secondNumberEmojis = "" // // holds the second number of randomly selected emojis
    @State private var userInput = ""
    @State private var audioPlayer: AVAudioPlayer?
    @State private var scoreCount = 0

    private var emojis = ["🍕", "🍎", "🍏", "🐵", "👽", "🧠", "🧜🏽‍♀️", "🧙🏿‍♂️", "🥷", "🐶", "🐹", "🐣", "🦄", "🐝", "🦉", "🦋", "🦖", "🐙", "🦞", "🐟", "🦔", "🐲", "🌻", "🌍", "🌈", "🍔", "🌮", "🍦", "🍩", "🍪"]
    

    var body: some View {
        VStack {
            Text("Your current score is: \(scoreCount)")
                .padding(.bottom)
            Group {
                Text("\(firstNumberEmojis)")
                Text("+")
                Text("\(secondNumberEmojis)")
            }
            .font(.system(size: 60))
            .minimumScaleFactor(0.5)
            .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                Text("\(firstNumber)")
                Text("+")
                Text("\(secondNumber)")
            }
            .font(.title)
            TextField("", text: $userInput)
                .textFieldStyle(.roundedBorder)
                .frame(width: 60)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 2)
                })
                .keyboardType(.numberPad)
                
            .font(.largeTitle)
            
            Button("Guess") {
                let correctAnswer = String(firstNumber + secondNumber)
                if userInput == correctAnswer {
                    print("Correct!")
                    scoreCount += 1
                    playAudio(fileName: "correct")
                    firstNumber = Int.random(in: 1...10)
                    secondNumber = Int.random(in: 1...10)
                    firstNumberEmojis = String(repeating: emojis.randomElement()!, count: firstNumber)
                    secondNumberEmojis = String(repeating: emojis.randomElement()!, count: secondNumber)
                    userInput = ""
                } else {
                    print("Wrong")
                    playAudio(fileName: "wrong")
                    firstNumber = Int.random(in: 1...10)
                    secondNumber = Int.random(in: 1...10)
                    firstNumberEmojis = String(repeating: emojis.randomElement()!, count: firstNumber)
                    secondNumberEmojis = String(repeating: emojis.randomElement()!, count: secondNumber)
                    userInput = ""
                    
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(userInput.isEmpty)
        }
        .padding()
        
        .onAppear {
            // When the screen appears, set the firstNumberEmojis and secondNumberEmojis to the function randomEmojiGenerator passing in the random firstNumber and secondNumber properties.
            firstNumberEmojis = String(repeating: emojis.randomElement()!, count: firstNumber)
            secondNumberEmojis = String(repeating: emojis.randomElement()!, count: secondNumber)
        }
    }
    
    func playAudio(fileName: String) {
        guard let soundFile = NSDataAsset(name: fileName) else {
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Could not find file")
        }
    }
    
    // This function needs to return a string becuase it will be used with firstNumberEmojis and secondNumberEmojis which are strings
//    func randomEmojiGenerator(number: Int) -> String {
//        var emojiString = ""
//        let randomEmoji = emojis.randomElement()!
//        for _ in 1...number {
//            emojiString.append(randomEmoji)
//        }
//        return emojiString // This will be assigned to the firstNumberEmojis and secondNumberEmojis which will then appear on the screen.
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
