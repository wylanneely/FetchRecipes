//
//  RecipeDetailViewTest.swift
//  FetchRecipesTests
//
//  Created by Wylan L Neely on 1/20/25.
//

import Testing
import SwiftUI
@testable import FetchRecipes

struct RecipeTests {

    @State var testRecipe = Recipe(
        cuisine: "American",
        name: "Recipe Test",
        id: "testID",
        photoUrlLarge: nil,
        photoURLSmall: nil,
        sourceUrl: URL(string: "https://www.youtube.com/watch?v=6_PAHbqq-o4"),
        youtubeUrl: nil
    )
    
    @Test("JSON Data turns to Recipes") func testJsonUnwrap() async throws {

        let recipes = try await NetworkController.fetchRecipes()
        
        #expect(recipes[0].name.isEmpty == false)
        #expect(recipes[0].cuisine.isEmpty == false )
    }
    
    @Test("testRecipe is passed to RecipeDetailView") func testCorrectRecipe() async throws {
        
        //Arrange
        var selectedRecipe: Recipe?
        let contentView = ContentView(onRecipeSelected: { recipe in
            selectedRecipe = recipe
        })

        await MainActor.run {
            contentView.recipes = [testRecipe]
        }
        
        await contentView.onRecipeSelected?(testRecipe)
        
        #expect(selectedRecipe != nil)
        #expect(selectedRecipe?.id == "testID")

        if let presentedRecipe = selectedRecipe {
        let detailView = RecipeDetailView(recipe: presentedRecipe)
                
        await #expect(detailView.recipe != nil)
        await #expect(detailView.recipe.id == "testID")
        await #expect(detailView.recipe.sourceUrl == URL(string: "https://www.youtube.com/watch?v=6_PAHbqq-o4"))
        }
    }
    

}
