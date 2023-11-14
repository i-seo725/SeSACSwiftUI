//
//  RenderView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/13/23.
//

import SwiftUI

struct RenderView: View {
    
    @State var age = 10
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Rectangle()
                        .fill(
                            AngularGradient(colors: [.orange, .red], center: .center, angle: .degrees(5555555))
                        )
                    Rectangle()
                        .fill(
                            RadialGradient(gradient: Gradient(colors: [.indigo, .purple]), center: .bottomTrailing, startRadius: 45, endRadius: 100)
                        )
                    Rectangle()
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [.pink, .yellow, .white]), startPoint: .bottom, endPoint: .topTrailing)
                        )
                }
                .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                NavigationLink("Push") {
                    MenuView()
                }
                Text("Hue: \(age) \(Int.random(in: 1...100))")
                Text("Hue: \(Int.random(in: 1...100))")
                bran
                KokoView()
                Button("클릭") {
                    age = Int.random(in: 1...100)
                }
            }
            .navigationTitle("navigation title")
            .navigationBarItems(leading: Text("클릭"))
        }
        
    }
    
    var bran: some View {
        Text("Bran: \(Int.random(in: 1...100))")
    }
}

#Preview {
    RenderView()
}

struct KokoView: View {
    var body: some View {
        Text("koko: \(Int.random(in: 1...100))")
    }
}
