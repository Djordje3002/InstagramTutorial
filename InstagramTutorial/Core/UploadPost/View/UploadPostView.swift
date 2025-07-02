import SwiftUI
import PhotosUI
import AVFoundation

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var showCamera: Bool = false
    @State private var showPhotoPicker: Bool = false
    @StateObject private var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            // Action toolbar
            HStack {
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    showCamera = false // Ensure camera is dismissed
                    showPhotoPicker = false // Ensure photo picker is dismissed
                    tabIndex = 0 // Return to main tab
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // Post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                
                TextField("Enter your caption...", text: $caption, axis: .vertical)
            }
            .padding()
            
            // Button to open photo library
            HStack {
                Button {
                    showPhotoPicker.toggle()
                } label: {
                    Image(systemName: "photo.on.rectangle.angled")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding()
                }
                Spacer()
            }
            
            Spacer()
        }
        .onAppear {
            showCamera = true // Open camera when view appears
        }
        // Camera picker
        .fullScreenCover(isPresented: $showCamera) {
            CameraPickerView(selectedImage: $viewModel.postImage)
                .ignoresSafeArea()
        }
        // Photo library picker
        .photosPicker(isPresented: $showPhotoPicker, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
