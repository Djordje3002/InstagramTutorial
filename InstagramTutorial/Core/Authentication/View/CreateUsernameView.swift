//
//  CreateUsernameView.swift
//  InstagramTutorial
//
//  Created by Djordje on 23. 6. 2025..
//

import SwiftUI

struct CreateUsernameView: View {
    @State private var username: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            VStack {
                Text("You will use this username in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            }
            
            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(MainButtonModifier())
            }
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        CreateUsernameView()
    }
}
