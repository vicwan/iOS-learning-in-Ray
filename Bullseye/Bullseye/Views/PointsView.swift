//
//  PointsView.swift
//  Bullseye
//
//  Created by Vic Wan on 2021/4/17.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue)
    let points = game.points(sliderValue: roundedValue)
    
    VStack(spacing: 10.0) {
      InstructionText(text: "The slider's value is".uppercased())
      BigNumberText(text: "\(roundedValue)")
      BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      }) {
          ButtonText(text: "Start New Round")
      }
      
      
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5.0, y: 5.0)
    .transition(.scale)
    
    
  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  
  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
    
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .preferredColorScheme(.dark)
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      .previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
  }
}
