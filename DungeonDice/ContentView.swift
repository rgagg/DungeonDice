//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 11/2/2025.
//

import SwiftUI

struct ContentView: View {
  
  @State private var resultMessage: String = ""
  
  enum Dice: Int {
    case four = 4
    case six = 6
    case eight = 8
    case ten = 10
    case twelve = 12
    case twenty = 20
    case hundred = 100
    
    func roll() -> Int {
      return Int.random(in: 1...self.rawValue)
    }
  }
  
  var body: some View {
    VStack {
      Text("Dungeon Dice")
        .font(.largeTitle)
        .fontWeight(.black)
        .foregroundStyle(.red)
      
      Spacer()
      
      Text(resultMessage)
        .font(.largeTitle)
        .fontWeight(.medium)
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.75)
        .frame(height: 150)
      
      Spacer()
      
      Group {
        HStack {
          Button {
            resultMessage = "You rolled \(Dice.four.roll()) on a \(Dice.four.rawValue) sided dice."
          } label: {
            Text("\(Dice.four.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
          
          Spacer()
          
          Button {
            resultMessage = "You rolled \(Dice.six.roll()) on a \(Dice.six.rawValue) sided dice."
          } label: {
            Text("\(Dice.six.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
          
          Spacer()
          
          Button {
            resultMessage = "You rolled \(Dice.eight.roll()) on a \(Dice.eight.rawValue) sided dice."
          } label: {
            Text("\(Dice.eight.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
        } // End hStack
        
        HStack {
          Button {
            resultMessage = "You rolled \(Dice.ten.roll()) on a \(Dice.ten.rawValue) sided dice."
          } label: {
            Text("\(Dice.ten.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
          
          Spacer()
          
          Button {
            resultMessage = "You rolled \(Dice.twelve.roll()) on a \(Dice.twelve.rawValue) sided dice."
          } label: {
            Text("\(Dice.twelve.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
          
          Spacer()
          
          Button {
            resultMessage = "You rolled \(Dice.twenty.roll()) on a \(Dice.twenty.rawValue) sided dice."
          } label: {
            Text("\(Dice.twenty.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
        } // End hStack
        
        HStack {
          Button {
            resultMessage = "You rolled \(Dice.hundred.roll()) on a \(Dice.hundred.rawValue) sided dice."
          } label: {
            Text("\(Dice.hundred.rawValue) Sided")
          }
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
        } // End hStack
      }
      .font(.title2)
      .buttonStyle(.bordered)
      .tint(.red)
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
