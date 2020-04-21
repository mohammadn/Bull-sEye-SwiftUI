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
    
    var body: some View {
        VStack {
            // Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            
            // Slider row
            HStack{
                Text("1")
                Slider(value: .constant(10))
                Text("100")
            }
            
            // Button row
            Button(action: {
                self.alertIsVissible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVissible) { () -> Alert in
                return Alert(title: Text("Hello There!"), message: Text("This is my first pop-up."), dismissButton: .default(Text("Awesome!")))
            }
            
            // Score row
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Start Over")
                }
                Text("Score:")
                Text("999")
                Text("Round")
                Text("999")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
