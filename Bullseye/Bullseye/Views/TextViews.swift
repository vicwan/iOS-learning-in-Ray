//
//  TextViews.swift
//  Bullseye
//
//  Created by Vic Wan on 2021/4/16.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.black)
      .font(.largeTitle)
      .kerning(-1.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: 35)
  }
}

struct LabelText: View {
  var title: String
  
  var body: some View {
    Text(title)
      .font(.caption)
      .kerning(1.5)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .font(.subheadline)
      .lineSpacing(12.0)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .frame(maxWidth: .infinity)
      .padding()
      .font(.headline)
      .foregroundColor(.white)
      .background(Color.accentColor)
      .cornerRadius(12.0)
  }
}

struct BigBoldText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .fontWeight(.black)
      .font(.title)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
  }
}

struct ScoreText: View {
  var score: Int
  var body: some View {
    Text(String(score))
      .bold()
      .font(.title3)
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
  }
}

struct DateText: View {
  var date: Date
  var body: some View {
    Text(date, style: .time)
      .bold()
      .font(.title3)
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      HStack {
        SliderLabelText(text: "1")
        SliderLabelText(text: "100")
      }
      LabelText(title: "SCORE")
      
      BodyText(text: "You scored 200 Points\n🎉🎉🎉")
      ButtonText(text: "Start New Round")
      BigBoldText(text: "LEADERBOARD")
      ScoreText(score: 459)
      DateText(date: Date())
    }
    .padding()
  }
}
