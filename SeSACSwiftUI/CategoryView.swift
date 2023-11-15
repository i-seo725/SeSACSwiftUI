//
//  CategoryView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/15/23.
//

import SwiftUI

/*
 ForEach
 1. ..< 닫힌 형태로 사용해야 함
 2. KeyPath 문법, \. 각각의 요소에 접근
 3. id값을 KeyPath로 사용, 보여주려는 모델은 Hashable 해야함
 4. id가 item에 들어감

 */

struct Category: Hashable, Identifiable {//id 변수를 강제로 쓰게 함 {
    let id = UUID()
    let name: String
    let count: Int
}


struct CategoryView: View {
    
    let category = [
        Category(name: "스릴러", count: 10),
        Category(name: "액션", count: 25),
        Category(name: "SF", count: 25),
        Category(name: "로맨스", count: 25),
        Category(name: "애니메이션", count: 17),
        Category(name: "SF", count: 28)
    ]
    
    var body: some View {
        VStack {
            ForEach(category, id: \.id) { item in
                Text("\(item.name) | \(item.count) 안녕하세여")
            }
        }
    }
}

#Preview {
    CategoryView()
}
