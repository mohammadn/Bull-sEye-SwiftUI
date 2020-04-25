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
    
    let midnightBlue = Color(red: 0.0 / 255.0, green: 51.0 / 255.0, blue: 102.0 / 255.0)
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.white)
                .font(Font.custom("ArialRoundedMTBold", size: 18))
                .modifier(Shadow())
        }
    }
    
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.yellow)
                .font(Font.custom("ArialRoundedMTBold", size: 24))
                .modifier(Shadow())
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 12))
        }
    }
    
    struct Shadow: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(targetValue)").modifier(ValueStyle())
            }
            Spacer()
            
            // Slider row
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            
            // Button row
            Button(action: {
                self.alertIsVissible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/).modifier(ButtonLargeTextStyle())
            }
            .alert(isPresented: $alertIsVissible) { () -> Alert in
                //let roundedValue = Int((sliderValue).rounded())
                return Alert(title: Text(alertTitle()), message: Text(
                    "The slider's value is \(sliderValueRounded()).\n" +
                    "You scored \(pointsForCurrentRun()) points this round"
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.totalScore += self.pointsForCurrentRun()
                        self.targetValue = Int.random(in: 1...100)
                        self.round += 1
                    })
            }
            .background(Image("Button")).modifier(Shadow())
            Spacer()
            
            // Score row
            HStack{
                Button(action: {
                    self.startNewGame()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(totalScore)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallTextStyle())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
            }
            .padding(.bottom, 20)
        }
        .background(Image("Background"), alignment: .center)
        .accentColor(midnightBlue)
        .navigationBarTitle("Bull's eye")
    }
    
    func sliderValueRounded() -> Int {
        Int((sliderValue).rounded())
    }
    
    func amountOff() -> Int {
        abs(sliderValueRounded() - targetValue)
    }
    
    func pointsForCurrentRun() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1{
            bonus = 50
        } else {
            bonus = 0
        }
        
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        
        let difference = amountOff()
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func startNewGame() {
        sliderValue = 40.0
        targetValue = Int.random(in: 1...100)
        totalScore = 0
        round = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
