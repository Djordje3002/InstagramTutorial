//
//  AddEmailView.swift
//  InstagramTutorial
//
//  Created by Djordje on 23. 6. 2025..
//
import SwiftUI

struct AddEmailView: View {
    @State private var email: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            VStack {
                Text("You will use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            }

            NavigationLink {
                CreateUsernameView()
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
        AddEmailView()
    }
}
