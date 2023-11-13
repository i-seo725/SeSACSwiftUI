//
//  MenuView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/13/23.
//

import SwiftUI

struct MenuView: View {
    
    var cardProperty: some View {
        VStack(spacing: 10) {
            Image(systemName: "star")
                .background(.red)
            Text("안뇽")
                .background(.green)
        }
        .padding()
        .background(.yellow)

    }
    
    var body: some View {
        
        VStack {
//            Spacer() //꽉 채워라 위에 하나 아래 2개 있음 1:2 비율의 공백
            HStack(spacing: 20) {
                cardProperty
//                CardView(image: "star", text: "토스증권")
                CardView(image: "person", text: "고객센터")
                CardView(image: "pencil", text: "토스뱅크")

            }
            List {
                Section("확인하기") {
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("오늘") })
                    Text("보안과 인증")
                        .modifier(PointBorderText())
                    Text("내 신용점수")
                    Text("진행 중인 이벤트")
                }
                Section("자산") {
                    ColorPicker("테마 설정", selection: .constant(.yellow))
                    Text("내 자산")
                    Text("송금하기")
                    Text("투자 모아보기")
                        .asPointBorderText()
                }
            }
            .listStyle(.grouped)
        }
        
        
    }
}

#Preview {
    MenuView()
}

struct CardView: View {
    
    let image: String
    let text: String
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: image)
                .background(.red)
            Text(text)
                .background(.green)
                .underline()
                .strikethrough()
        }
        .padding()
        .background(.yellow)
    }
}

//custom modifier
struct PointBorderText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .foregroundStyle(.white)
            .background(.purple)
            .clipShape(.capsule) //iOS 17 이상
    }
}


extension View {
    
    func asPointBorderText() -> some View {
        modifier(PointBorderText())
    }
    
}
