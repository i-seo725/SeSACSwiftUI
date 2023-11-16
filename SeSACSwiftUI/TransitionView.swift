//
//  TransitionView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/15/23.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isFull = false
    @State private var isSheet = false
    
    init(isFull: Bool = false, isSheet: Bool = false) {
        self.isFull = isFull
        self.isSheet = isSheet
        print("TransitionView Init")
    }
    
    var body: some View {
        NavigationView {
            HStack(spacing: 20) {
                Button(action: {
                    isFull.toggle()
                }, label: {
                    Text("Full")
                })
                
                Button(action: {
                    isSheet.toggle()
                }, label: {
                    Text("Sheet")
                })
                
                //navigationlink가 renderview 인스턴스를 갖고 있는 형태라 같이 init 됨
                //네트워크 통신 구문을 renderview init 구문에 넣으면 의도한 시점과 다르게 호출될 수 있음
                //필요하다면 view 안에 넣어주기
                NavigationLink("Push") {
                    NavigationLazyView(RenderView())
                }
                NavigationLink("Push") {
                    NavigationLazyView(PosterView())
                }
            }
            .sheet(isPresented: $isSheet, content: {
                RenderView()
            })
            .fullScreenCover(isPresented: $isFull, content: {
                RenderView()
        })
        }
    }
}

#Preview {
    TransitionView()
}
