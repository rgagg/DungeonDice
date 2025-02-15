//
//  ButtonLayoutView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 15/2/2025.
//

import SwiftUI

struct ButtonLayoutView: View {
  @State private var buttonsLeftOver = 0 // Number of button on last row
  @Binding var resultMessage: String
  
  private let buttonwidth: CGFloat = 102 // Button width
  private let spacing: CGFloat = 0 // LazyVGrid spacing between buttons
  let horizontalPadding: CGFloat = 20
  
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
  
  // A preference key struct the we will use to
  // pass values from a child view to a parent view.
  struct DeviceWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
      value = nextValue()
    }
    
    typealias Value = CGFloat
  }
  
  var body: some View {
    
    VStack {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonwidth), spacing: spacing)]) {
        ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
          
          Button {
            resultMessage = "You rolled \(dice.roll()) on a\n\(dice.rawValue) sided dice."
          } label: {
            Text("\(dice.rawValue) Sided")
          }
          .buttonStyle(.bordered)
          .tint(.red)
          .overlay {
            RoundedRectangle(cornerRadius: 12)
              .stroke(.red, lineWidth: 2)
          }
        }
      }
      
      HStack {
        ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
          Button {
            resultMessage = "You rolled \(dice.roll()) on a\n\(dice.rawValue) sided dice."
          } label: {
            Text("\(dice.rawValue) Sided")
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
    .overlay {
      GeometryReader { geo in
        Color.clear
          .preference(key: DeviceWidthPreferenceKey.self, value: geo.size.width)
      }
    }
    .onPreferenceChange(DeviceWidthPreferenceKey.self) { deviceWidth in
      arrangeGridItems(deviceWidth: deviceWidth)
    }
  }
  
  func arrangeGridItems(deviceWidth: CGFloat) {
    var screenWidth = deviceWidth - horizontalPadding * 2
    
    if Dice.allCases.count > 1 {
      screenWidth += spacing
    }
    
    // Number of buttons per row as an Int
    let numberOfButtonsPerRow = Int(screenWidth / (buttonwidth + spacing))
    
    // Number of buttons on last row
    buttonsLeftOver =  Dice.allCases.count % numberOfButtonsPerRow
  }
}


#Preview {
  ContentView()
//    ButtonLayoutView()
}
