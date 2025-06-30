//
//  EditProfileView.swift
//  InstagramTutorial
//
//  Created by Djordje on 28. 6. 2025..
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel : EditProfileViewModel

    init(user: User) {
        self._viewModel = .init(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
//            toolbar
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                        }
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                Divider()
            }
//            edit profile pic
            VStack {
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack {
                       if let image = viewModel.profileImage {
                            image
                               .resizable()
                               .foregroundStyle(.white)
                               .background(.gray)
                               .clipShape(Circle())
                               .frame(width: 80, height: 80)
                        } else {
                            Image(systemName: "person.circle")
                                .resizable()
                                .foregroundStyle(.white)
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 80, height: 80)
                       }
                        
                        Text("Edit profile picture")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    .padding()
                }
                Divider()
            }
//            edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
                Divider()
            }
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
