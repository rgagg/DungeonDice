//
//  ContentView.swift
//  DungeonDice
//
//  Created by Richard Gagg on 11/2/2025.
//

import SwiftUI

struct ContentView: View {
  @State private var resultMessage: String = ""
  @State private var animationTrigger: Bool = false
  @State private var isDoneAnimating: Bool = true
  
  var body: some View {
    VStack {
      titleView
      Spacer()
      resultMessageView
      Spacer()
      ButtonLayoutView(resultMessage: $resultMessage, animationTrigger: $animationTrigger)
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
      .scaleEffect(isDoneAnimating ? 1.0 : 0.4)
      .opacity(isDoneAnimating ? 1.0 : 0.2)
      .rotation3DEffect(
        isDoneAnimating ? .degrees(360) : .degrees(0),
        axis: (x: 0, y: 0.5, z: 0))
      .frame(height: 150)
      .onChange(of: animationTrigger) {
        isDoneAnimating = false
//        withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
//          isDoneAnimating = true
//        }
        withAnimation(.interpolatingSpring(Spring(duration: 0.7, bounce: 0.3))) {
          isDoneAnimating = true
        }
      }
  }
}

#Preview {
  ContentView()
}

