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
        Text("Hue: \(age) \(Int.random(in: 1...100))")
        Text("Hue: \(Int.random(in: 1...100))")
        bran
        KokoView()
        Button("클릭") {
            age = Int.random(in: 1...100)
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
