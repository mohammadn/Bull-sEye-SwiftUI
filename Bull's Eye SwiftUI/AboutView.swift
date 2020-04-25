//
//  AboutView.swift
//  Bull's Eye SwiftUI
//
//  Created by Mohammad Najafzade on 4/25/20.
//  Copyright © 2020 mohammadn. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    let lightOrange = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct AboutHeadingStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 30).bold())
                .padding(.vertical, 20)
        }
    }
    
    struct AboutBodyStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
                .foregroundColor(Color.black)
                .font(Font.custom("ArialRoundedMTBold", size: 16).bold())
                .padding(.horizontal, 60)
                .padding(.bottom, 20)
        }
    }
    
    var body: some View {
        Group{
            VStack{
                Text("🎯 Bullseye 🎯").modifier(AboutHeadingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(AboutBodyStyle())
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutBodyStyle())
                Text("Enjoy!").modifier(AboutBodyStyle())
            }
            .background(lightOrange)
            .navigationBarTitle("About view")
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
