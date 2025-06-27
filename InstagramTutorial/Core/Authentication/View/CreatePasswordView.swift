//
//  CreateUsernameView.swift
//  InstagramTutorial
//
//  Created by Djordje on 23. 6. 2025..
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Text("Create password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            VStack {
                Text("You will use this password must be at lease six characters long")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            }
            
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden()
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
        CreatePasswordView()
    }
}
