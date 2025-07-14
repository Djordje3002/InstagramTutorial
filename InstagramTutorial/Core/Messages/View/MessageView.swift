//
//  MessageView.swift
//  InstagramTutorial
//
//  Created by Djordje on 14. 7. 2025..
//

import SwiftUI

struct MessageView: View {
    @Environment(\.dismiss) private var dismiss

        var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .padding()
                    }
                }
                Spacer()
                Text("This is the Paperplane Screen")
                    .font(.largeTitle)
                Spacer()
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button if you want
        }
}

#Preview {
    MessageView()
}
