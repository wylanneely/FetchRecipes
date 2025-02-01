//
//  RecipeDetailView.swift
//  FetchRecipes
//
//  Created by Wylan L Neely on 1/21/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @StateObject private var imageLoader = ImageLoader()

    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 12)

                Text(recipe.name)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 280)
                        .clipShape(Circle())
                        .padding(.bottom, 10)
                } else {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 280, height: 280)
                        .onAppear {
                            if let photoUrlLarge = recipe.photoUrlLarge {
                                imageLoader.loadImage(from: photoUrlLarge)
                            }
                        }
                }

                Text(recipe.cuisine)
                    .font(.body)
                    .padding()
                if let youtubeURL = recipe.youtubeUrl {
                    Text("Watch Recipe Video:")
                        .font(.headline)
                    WebView(url: youtubeURL)
                        .frame(height: 400)
                        .cornerRadius(15)
                        .padding()
                } else {
                    Text("No video available.")
                        .foregroundColor(.gray)
                        .padding()
                }
                if let sourceUrl = recipe.sourceUrl {
                    Link(destination: sourceUrl) {
                        Label {
                            Text("Recipe Source")
                        } icon: {
                            
                        }

                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}
