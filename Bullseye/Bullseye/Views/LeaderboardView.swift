//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Vic Wan on 2021/4/18.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10.0) {
            ForEach(game.leaderboardEntries.indices) { i in
              let leaderboardEntry = game.leaderboardEntries[i]
              RowView(index: i + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View {
    
    ZStack {
      HStack {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
          BigBoldText(text: "leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "leaderboard")
        }
      }
      
      HStack {
        Spacer()
        Button(action: {
          leaderboardIsShowing = false
        }, label: {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        })
        .padding(.top)
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(title: "Score")
        .frame(width:Constants.Leaderboard.leaderboardScoreColWidth)
      Spacer()
      LabelText(title: "Date")
        .frame(width:Constants.Leaderboard.leaderboardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
      Spacer()
      DateText(date: date)
      
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
    
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).preferredColorScheme(.dark)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
  }
}
