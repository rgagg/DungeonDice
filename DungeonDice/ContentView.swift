//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 11/2/2025.
//

import SwiftUI

struct ContentView: View {
  
  @State private var resultMessage: String = ""
  
  enum Dice: Int, CaseIterable {
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
      
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
        Group {
          ForEach(Dice.allCases, id: \.self) { dice in
            Button {
              resultMessage = "You rolled \(dice.roll()) on a\n\(dice.rawValue) sided dice."
            } label: {
              Text("\(dice.rawValue) Sided")
            }
          }
          .buttonStyle(.bordered)
          .tint(.red)
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
        }
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
