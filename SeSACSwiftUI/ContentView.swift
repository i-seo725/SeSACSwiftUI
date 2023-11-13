//
//  ContentView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {//some View {   //연산 프로퍼티
        
        //viewModifier: .으로 이어지는 속성들
//        Button("클릭") {
//            let value = type(of: self.body)
//            print(value)
//        }
//        .foregroundStyle(.yellow)
//        .background(.blue)
        
        //modifier를 사용할 때마다 뷰 객체 반환돼서 계층이 계속 쌓임
        VStack {
            Text("안녕하세요")  //다국어 대응 디폴트로 됨
                .foregroundColor(.blue)
                .font(.largeTitle)
                .background(Color.green)
                .padding()
                .background(Color.yellow)
            .border(.blue, width: 10)
            
            Text("안녕하세요")
                .foregroundColor(.blue)
                .font(.largeTitle)
                .background(Color.green)
                .padding()
                .background(Color.yellow)
                .border(.blue, width: 10)
        }
        

    }
}

#Preview {
    ContentView()
}
