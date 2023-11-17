//
//  ChartView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/17/23.
//

import SwiftUI
import Charts

struct ChartView: View {

    let movie: [Movie]
    
    @Environment(\.colorScheme) var color

    //body를 제외하고 뷰를 리턴하는 경우 뷰빌더 래퍼 사용했었는데 안 써도 되게 해줬었음
    //조건문을 통해 뷰를 리턴할 땐 사용해야 함
    //body는 내장되어있어서 쓸 필요가 없음
    @ViewBuilder
    var chartTitle: some View {
        if color == .dark {
            HStack {
                Text("어두운 차트")
                Image(.cat1)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        } else {
            Text("밝은 차트")
        }
    }
    
    var body: some View {
        VStack {
            chartTitle
            Chart(movie, id: \.id) { item in
//                BarMark(
//                RectangleMark(
//                LineMark(
                AreaMark(
                    x: .value("장르", item.name),
                    y: .value("관람횟수", item.count)
                )
                .foregroundStyle(Color.random())
            }
            .frame(height: 300)
        }
    }
}

#Preview {
    ChartView(movie: [
    Movie(name: "영화"),
    Movie(name: "드라마"),
    Movie(name: "애니메이션"),
    Movie(name: "클래식"),
    Movie(name: "스포츠")
    ])
}
