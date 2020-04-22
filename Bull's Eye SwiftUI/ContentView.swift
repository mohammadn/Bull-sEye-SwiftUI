//
//  ContentView.swift
//  Bull's Eye SwiftUI
//
//  Created by Mohammad Najafzade on 4/12/20.
//  Copyright © 2020 mohammadn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVissible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var targetValue: Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(targetValue)")
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            
            // Button row
            Button(action: {
                self.alertIsVissible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVissible) { () -> Alert in
                var roundedValue: Int = Int((self.sliderValue).rounded())
                return Alert(title: Text("Hello There!"), message: Text(
                    "The slider's value is \(roundedValue).\n" +
                    "You scored \(self.pointsForCurrentRun()) points this round"
                ), dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            
            // Score row
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("999999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    func pointsForCurrentRun() -> Int {
        
        var roundedValue: Int = Int((self.sliderValue).rounded())
        var difference: Int = roundedValue - self.targetValue
        
        if difference < 0 {
            difference *= -1
        }
        
        var awardedPoints: Int = 100 - difference
        
        return awardedPoints
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
