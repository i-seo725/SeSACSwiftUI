//
//  PosterView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/15/23.
//

import SwiftUI
/*
 VStack : 전체 데이터 로드
 LazyVstack : 보여지는 부분만 로드, list도 lazy로 동작
 AsyncImage : 킹피셔같이 사용할 수 있음
 */


struct PosterView: View {
    
    @State private var isPresent = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(0..<40) { item in
                    AsyncImageView()
                    //frame 지정을 하지 않았을 때 프로그레스뷰가 많이 보이게 되어서 네트워크 통신이 많이 일어남
                    //네트워크 통신이 성공한 뒤에 사이즈가 100*100으로 변경됨
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            isPresent.toggle()
                        }
                }
            }
//            .frame(maxWidth: .infinity)
        }
        .background(.gray)
        .sheet(isPresented: $isPresent, content: {
            CategoryView()
        })
//        .contentMargins(50, for: .scrollContent)
        
    }
}

struct AsyncImageView: View {
    
    let url = URL(string: "https://picsum.photos/200")
    
    var body: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView() //실패, 성공하기 전
            case .success(let image):
                image
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .failure(_):
                Image(.bird)
            @unknown default:
                Image(.bird)
            }
        }

    }
}

#Preview {
    AsyncImageView()
}

/*
 AsyncImage(url: url) { image in
     image
         .frame(width: 100, height: 100)
         .scaledToFit()
         .clipShape(RoundedRectangle(cornerRadius: 10))
//                .cornerRadius(10)
 } placeholder: {
     ProgressView()
 }
 */
