//
//  NavigationLazyView.swift
//  SeSACSwiftUI
//
//  Created by 이은서 on 11/16/23.
//

import SwiftUI

struct NavigationLazyView<T: View>: View {
    
    let build: () -> T
    //@autoclosure : 클로저 구문인데 중괄호 안 써도 되게 함
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}
