//
//  UploadPostViewModel.swift
//  InstagramTutorial
//
//  Created by Djordje on 25. 6. 2025..
//

import SwiftUI
import PhotosUI
import _PhotosUI_SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image?
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uitImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uitImage)
    }
}
