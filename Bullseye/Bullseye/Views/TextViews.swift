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
    }
  }
}
