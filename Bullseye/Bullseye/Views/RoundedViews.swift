//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Vic on 2021/4/16.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.roundedViewLength,
             height: Constants.General.roundedViewLength)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: Constants.General.roundedViewLength,
             height: Constants.General.roundedViewLength)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.title3)
      .kerning(-0.2)
      .bold()
      .foregroundColor(Color("TextColor"))
      .padding(EdgeInsets(top: 15, leading: 12, bottom: 15, trailing: 12))
      .frame(width: Constants.General.roundRectViewWidth,
             height: Constants.General.roundRectViewHeight)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
  }
}

struct RoundedTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.semibold)
      .font(.title3)
      .frame(width: Constants.General.roundedViewLength,
             height: Constants.General.roundedViewLength)
      .foregroundColor(Color("TextColor"))
      .overlay(
        Circle()
          .stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
      )
  }
}

struct Preview: View {
  var body: some View {
    VStack(spacing: 10.0) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      RoundedImageViewStroked(systemName: "list.dash")
      
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      RoundedImageViewFilled(systemName: "list.dash")
      
      RoundRectTextView(text: "111")
      RoundedTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    Preview()
    Preview().preferredColorScheme(.dark)
  }
}
