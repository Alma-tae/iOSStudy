//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Sinchon on 2021/05/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        Text("Hello, world!")
            .padding()
            .font(.largeTitle)
        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
        */
        VStack{
            Text("1")
            Text("2")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*
        ContentView()
            .previewDevice(PreviewDevice(rawValue:"iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
        */
        Group{
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName("iPhone SE 2")
                .environment(\.colorScheme, .dark)
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                .previewDisplayName("iPhone 12")
        }
    }
}
