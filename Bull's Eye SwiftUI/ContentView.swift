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
    @State var knockKnockIsVissible: Bool = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .fontWeight(.bold)
                .foregroundColor(Color.green)
            Button(action: {
                self.alertIsVissible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
            .alert(isPresented: $alertIsVissible) { () -> Alert in
                return Alert(title: Text("Hello There!"), message: Text("This is my first pop-up."), dismissButton: .default(Text("Awesome!")))
            }
            Button(action: {
                self.knockKnockIsVissible = true
            }) {
                Text("Knock knock!")
            }
            .alert(isPresented: $alertIsVissible) { () -> Alert in
                return Alert(title: Text("Who is there?"), message: Text("It's me."), dismissButton: .default(Text("That was fun!")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
