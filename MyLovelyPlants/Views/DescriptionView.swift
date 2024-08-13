//
//  DescriptionView.swift
//  MyLovelyPlants
//
//  Created by 여나경 on 8/12/24.
//

import SwiftUI

// TODO: 저장된 이미지 리스트, 식물명 출력
struct DescriptionView: View {
    var body: some View {
        VStack {
            Image(systemName: "tree")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 400, alignment: .center)
                .border(.gray)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    DescriptionView()
}
