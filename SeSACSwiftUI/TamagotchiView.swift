//
//  TamagotchiView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/14/23.
//

import SwiftUI

struct User {
    
    var nickname = "고래밥"
    
    var introduce: String {
        mutating get {
            nickname = "포카칩"
            return "안녕하세요 \(nickname)입니다"
        }
    }
    mutating func changeNickname() {
        nickname = "칙촉"
    }
    
}


//앱에서 UI는 Data에 의존해서 자신의 상태를 결정하게 된다
struct TamagotchiView: View {
    
    //nickname을 기준(@State를 가져서)으로 바디값이 바뀌면 렌더링
    //@State: SoT(Source of Truth) 고유한 데이터, 상태 프로퍼티(State Property)
    //        기준이 되어 뷰가 렌더링 됨, 뷰에 대한 상태 관리(저장)를 위해 존재
    //        해당 뷰에 대한 관리만 하기 때문에 private 키워드 사용하면 좋음
    @State private var waterCount = 0
    @State private var riceCount = 0
    @State private var isOn = false
    @State private var inputText = ""
    
    var body: some View {
        
        VStack() {
            
            TextField("밥알 개수 입력하기", text: $inputText)
                .padding()
            
            Toggle("스위치", isOn: $isOn)
                .padding()
            
            //@Binding으로 참조된 데이터를 파생된 데이터(Derived Value)라고 함, $를 앞에 붙여서 Binding 타입으로
            ExtractedView(title: "밥알", count: $riceCount)
            
            Button("밥 주기") {
                riceCount += 1
                isOn.toggle()
            }
            .padding(100)
            .background(.black)
            
            ExtractedView(title: "물방울", count: $waterCount)
            
            Button(action: {
                waterCount += 1
            }, label: {  //스택 넣고 디자인 할 수 있음
                Text("물방울 먹이기")
                    .padding(50)
                    .background(.red)
            })

        }
        .padding(100) //공통적인 내용은 vstack에 적용해도 됨
        
        
    }
}

#Preview {
    TamagotchiView()
}

struct ExtractedView: View {
    
    let title: String
    //Binding: 데이터 동기화를 위해 사용, 고유한 값 관리?, 하위뷰의 값과 상위뷰의 값 동기화
    @Binding var count: Int   //State로 하면 상위뷰와 데이터가 일치하지 않게 됨, 고유하게 자신만의 값을 관리해서
    
    var body: some View {
        HStack {
            Text("\(title) 개수: \(count)")
                .background(.yellow)
                .foregroundColor(.blue)
                .font(.title)
            
            Button("또 주기") {
                count += 1
            }
        }
    }
}
