//
//  ContentView.swift
//  Bullseye
//
//  Created by Vic Wan on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible = false
  @State private var sliderValue = 10.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack {
        InstructionsView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the bulls eye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct HitMeButton: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button(action: {
      print("hello, swiftUI")
      alertIsVisible = true
    }) {
      Text("Hit me".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(EdgeInsets(top: 22, leading: 24, bottom: 22, trailing: 24))
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        
      })
    .foregroundColor(.white)
    .cornerRadius(21.0)
    
    
    .alert(isPresented: $alertIsVisible, content: {
      let roundedValue = Int(sliderValue.rounded())
      return Alert(title: Text("Hello there!"), message: Text("The slider value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome!")))
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView().previewLayout(.fixed(width: 568, height: 320))
    
    ContentView().preferredColorScheme(.dark)
    ContentView().previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
  }
}
