//
//  RenderView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/13/23.
//

import SwiftUI

struct RenderView: View {
    //Property Wrapper
    //Environment : 시스템에서 정의된 값을 감지하고 뷰를 업데이트 할 수 있음, 커스텀하게 만들 수 있음
    //\. keypath 문법
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss //presentationMode 없어지고 생기는거
    @Environment(\.colorScheme) var colorScheme //라이트모드, 다크모드
    @State var age = 10

    init(age: Int = 10) {
        self.age = age
        print("RenderView Init")
    }
    
    
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
                Button(colorScheme == .dark ? "다크모드 클릭" : "라이트모드 클릭") {
//                    presentationMode.wrappedValue.dismiss()
                    dismiss.callAsFunction()
                }
                .background(colorScheme == .dark ? .yellow : .gray)
                .foregroundStyle(colorScheme == .dark ? .gray : .yellow)
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
