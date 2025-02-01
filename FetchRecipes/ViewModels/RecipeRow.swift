//
//  RecipeRow.swift
//  FetchRecipes
//
//  Created by Wylan L Neely on 1/21/25.
//

import SwiftUI


struct RecipeRow: View {
    
    let recipe: Recipe
    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        HStack {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } else {
                //Place Holder Image
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .onAppear {
                        if let photoUrlSmall = recipe.photoUrlSmall {
                            imageLoader.loadImage(from: photoUrlSmall)
                        }
                    }
            }
            Text(recipe.name)
                .font(.headline)
                .padding(.top, 8)
        }
        .padding(.vertical, 10)
    }
}


