//
//  Shapes.swift
//  Bullseye
//
//  Created by Vic on 2021/4/16.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShape = false
  
  var body: some View {
    VStack {
      if !wideShape {
        Circle()
          .strokeBorder(Color.blue, lineWidth: 20.0)
          .frame(width: 200, height: 100)
      }
      let w = CGFloat(wideShape ? 200.0 : 100.0)
      
      RoundedRectangle(cornerRadius: 20.0)
        .fill(Color.blue)
        .frame(width: w, height: 100)
      Capsule()
        .fill(Color.blue)
        .frame(width: w, height: 100)
      Ellipse()
        .fill(Color.blue)
        .frame(width: w, height: 100)
      Button(action: {
        withAnimation {
          wideShape.toggle()
        }
        
      }, label: {
        Text("Animate!")
      })
    }
    .background(Color.green)
    
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
  }
}
