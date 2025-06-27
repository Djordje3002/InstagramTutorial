//
//  UserStatView.swift
//  InstagramTutorial
//
//  Created by Djordje on 23. 6. 2025..
//

import SwiftUI

struct UserStatView: View {
    let value : Int
    let title : String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
    }
}

#Preview {
    UserStatView(value: 2, title: "followers")
}
