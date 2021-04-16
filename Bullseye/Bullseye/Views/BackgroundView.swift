//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Vic on 2021/4/16.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
    )
  }
}

struct TopView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      Spacer()
      RoundedImageViewFilled(systemName: "list.dash")
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "SCORE", text: String(game.score))
      Spacer()
      NumberView(title: "ROUND", text: String(game.round))
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  
  var body : some View {
    VStack {
      LabelText(title: title.uppercased())
      RoundRectTextView(text: text)
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
