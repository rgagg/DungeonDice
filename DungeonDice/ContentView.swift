//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 11/2/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var resultMessage: String = ""
  
  var body: some View {
    VStack {
      titleView
      Spacer()
      resultMessageView
      Spacer()
      ButtonLayoutView(resultMessage: $resultMessage)
    }
    .padding()
  }
}

extension ContentView {
  private var titleView: some View {
    Text("Dungeon Dice")
      .font(Font.custom("Papyrus", size: 60))
      .fontWeight(.black)
      .foregroundStyle(.red)
      .minimumScaleFactor(0.5)
      .lineLimit(1)
  }
  
  private var resultMessageView: some View {
    Text(resultMessage)
      .font(Font.custom("Papyrus", size: 60))
      .fontWeight(.medium)
      .multilineTextAlignment(.center)
      .minimumScaleFactor(0.5)
      .lineLimit(2)
      .frame(height: 150)
  }
}

#Preview {
  ContentView()
}

