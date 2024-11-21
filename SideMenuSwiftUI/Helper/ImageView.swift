//
//  ImageView.swift
//  SideMenuSwiftUI
//
//  Created by Surajit Dhara on 26/12/23.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    init(urlString: String?) {
        imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageViewModel.image ?? UIImage())
            .resizable()
    }
}
