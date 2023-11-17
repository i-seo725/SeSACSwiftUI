//
//  GridView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/17/23.
//

import SwiftUI

struct GridView: View {
    
    @Binding var movie: [Movie]
    
    @State var dummy = Array(1...100).map { "오늘의 영화 순위 \($0)" }
//    private let layout = [
//        GridItem(.fixed(200)),
//        GridItem(.fixed(200))
//    ]
    
//    private let layout = [
//        GridItem(.flexible(minimum: 100, maximum: 250)),
//        GridItem(.fixed(100)),
//        GridItem(.fixed(100))
//    ]
    
    private let layout = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: layout, content: {
                ForEach(dummy, id: \.self) { item in
                    ZStack {
                        Color.random()
                        Text(item)
                    }
                }
            })
            .padding()
        }
        .onAppear {
            dummy.insert("두둥", at: 0)
        }
//        .task { //비동기로 처리해야 하는 일 수행할 때 사용
//            <#code#>
//        }

    }
}

#Preview {
    //.constant 바인딩으로 값을 감싸줌
    GridView(movie: .constant([
        Movie(name: "영화"),
        Movie(name: "드라마"),
        Movie(name: "애니메이션"),
        Movie(name: "클래식"),
        Movie(name: "스포츠")
        ]))
}
