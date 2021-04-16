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
      .frame(width: 56.0, height: 56.0)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: 56.0, height: 56.0)
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
      .frame(width: 68, height: 56)
      .overlay(
        RoundedRectangle(cornerRadius: 21.0)
          .stroke(lineWidth: 2.0)
          .foregroundColor(Color("ButtonStrokeColor"))
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
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    Preview()
    Preview().preferredColorScheme(.dark)
  }
}
