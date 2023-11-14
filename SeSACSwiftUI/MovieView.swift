//
//  MovieView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/14/23.
//

import SwiftUI

struct MovieView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        ZStack { //컬러도 뷰, 색 위에 뭔가 두려면 겹치기 때문에 zstack 사용
            Color.orange
                .ignoresSafeArea() //safeArea 무시
            Text("치킨")
            Image("bird")
                .resizable()
                .scaledToFit()
            Image(systemName: "star")
            Image(.tiger)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
                .border(.orange, width: 5)
            
            VStack {
                Button("show") {
                    isPresented = true //화면을 띄워주기 위한 트리거
                }
                .padding()
                .background(.white)
                Spacer()
                HStack {
                    Circle()
                    Circle()
                    Circle()
                }
            }
            
        }
        //        HStack {
        //            Circle()
        //            Circle()
        //            Circle()
        //            RoundedRectangle(cornerRadius: 20)
        //
        //            Image("cat1")
        //                .resizable()
        //                .frame(width: 100, height: 100)
        //            Image(.cat2)
        //                .resizable()
        //                .frame(width: 100, height: 100)
        //            Image(.cat3)
        //                .resizable()
        //                .frame(width: 100, height: 100)
        //        }
        .sheet(isPresented: $isPresented, content: { //화면 전환 코드
            TamagotchiView()
        })
//        .fullScreenCover(isPresented: $isPresented, content: {
//            TamagotchiView()
//        })
    }
}

#Preview {
    MovieView()
}
