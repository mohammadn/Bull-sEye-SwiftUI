//
//  ContentView.swift
//  Bull's Eye SwiftUI
//
//  Created by Mohammad Najafzade on 4/12/20.
//  Copyright © 2020 mohammadn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVissible = false
    @State var sliderValue = 40.0
    @State var targetValue = Int.random(in: 1...100)
    @State var totalScore = 0
    @State var round = 1
    
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
                Slider(value: $sliderValue, in: 1...100)
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
                //let roundedValue = Int((sliderValue).rounded())
                return Alert(title: Text("Hello There!"), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRun()) points this round"
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.totalScore += self.pointsForCurrentRun()
                        self.targetValue = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            Spacer()
            
            // Score row
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score:")
                Text("\(totalScore)")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func sliderValueRounded() -> Int {
        Int((sliderValue).rounded())
    }
    
    func pointsForCurrentRun() -> Int {
        100 - abs(sliderValueRounded() - targetValue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
