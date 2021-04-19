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
    ZStack {
      VStack {
        TopView(game: $game)
        Spacer()
        BottomView(game: $game)
      }
      .padding()
      .background(
        RingsView()
      )
    }
  }
}

struct RingsView: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      let opacity = colorScheme == ColorScheme.dark ? 0.1 : 0.3
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(0.8 * opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300)
          )
          
          .frame(width: size, height: size)
          
      }
    }
  }
}

struct TopView: View {
  @Binding var game: Game
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }, label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      })
      Spacer()
      Button(action: {
        leaderboardIsShowing = true
      }, label: {
        RoundedImageViewFilled(systemName: "list.dash")
      })
      .sheet(isPresented: $leaderboardIsShowing, onDismiss: {
        print("View dismissed!")
      }, content: {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing)
      })
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
    BackgroundView(game: .constant(Game())).preferredColorScheme(.dark)
  }
}
