//
//  ContentView.swift
//  Apple_Swift_Tutorial
//
//  Created by Riley Marshall on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var centsInput: String = ""
    @State private var resultSentence: String = "Currency Results Here"
    
    var body: some View {
        VStack (alignment: .leading){
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            Text("Hello, world!")
                .font(.title)
                .foregroundColor(.red)
            
            HStack {
                            TextField("Enter cents", text: $centsInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)

                Button("Calculate") {
                    if let cents = Int(centsInput) {
                        resultSentence = printUSCoins(cents)
                    } else {
                        resultSentence = "Invalid input. Please enter a valid number of cents :)"
                    }
                }
                        }
                        
                        Text(resultSentence)
                            .font(.subheadline)
                    }
                    .padding()
    }
}

func printUSCoins(_ cents: Int) -> String {
    let quarters = cents / 25
    let dimes = (cents % 25) / 10
    let nickels = ((cents % 25) % 10) / 5
    let pennies = ((cents % 25) % 10) % 5
    var resultSentence = ""
    
    if quarters > 0 {
        resultSentence.append("\(quarters) \(quarters == 1 ? "quarter " : "quarters ")")
    }
    
    if dimes > 0 {
        resultSentence.append("\(dimes) \(dimes == 1 ? "dime " : "dimes ")")
    }
    
    if nickels > 0 {
        resultSentence.append("\(nickels) \(nickels == 1 ? "nickel " : "nickels ")")
    }
    
    if pennies > 0 {
        resultSentence.append("\(pennies) \(pennies == 1 ? "penny " : "pennies ")")
        
    }
    

    return (resultSentence)
}


#Preview {
    ContentView()
}

