//
//  ContentView.swift
//  FetchRecipes
//
//  Created by Wylan L Neely on 1/14/25.
//
import SwiftUI
import os

struct ContentView: View {
    
    @State var recipes: [Recipe] = []
    @State private var errorMessage: String?
    @State var selectedRecipe: Recipe?
    
    var onRecipeSelected: ((Recipe) -> Void)? // Callback for testing
    

    var body: some View {
        VStack {
            Text("Recipes")
                .font(.largeTitle)
            
            if let errorMessage = errorMessage {
                Text("Recipes Not Found.")
                    .onAppear {
                        // Log error
                        os_log("Error: %@", log: .default, type: .error, errorMessage)
                    }
            } else {
                List(recipes) { recipe in
                    Button(action: {
                        selectedRecipe = recipe
                        onRecipeSelected?(recipe) // To test when a reciept is selected
                    }) {
                        RecipeRow(recipe: recipe)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .refreshable {
                    shuffleRecipes()
                }
            }
        }
        .task {
            await loadRecipes()
        }
        .sheet(item: $selectedRecipe) { recipe in
            RecipeDetailView(recipe: recipe)
        }
    }
        
    private func loadRecipes() async {
            do {
                recipes = try await NetworkController.fetchRecipes()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    
    
    private func shuffleRecipes() {
            recipes.shuffle()
        }
}


