# FetchRecipes
FetchRecipe take home project

### Summary: Recipe App is a simple app that helps you find the best recipes from around the world. Just swipe to refresh, watch the video or tap source to read how to do it. Below is a link to a small preview of this simple app.
https://drive.google.com/file/d/1G-rHyGsHnhETG97vYkOgaHHkw3sXUPVq/view?usp=sharing

### Focus Areas: I focused on refactoring the ContentView and RecipeDetailView code to make them simple to read and maintain. I also wanted the NetworkController and ImageLoader to be robust, yet flexible for future use cases.

### Time Spent: I spent about 5 hours spread over the course of a week on this project.

### Trade-offs and Decisions: Instead of caching the entire recipe, I decided to cache just the images for each recipe. This was due to the images being the heaviest elements to download and convert from data. I also chose to create my own image loader instead of using AsyncImage to provide better control over caching and loading, encapsulating this logic outside of the ContentView.

### Weakest Part of the Project: I could have added more tests and tags for better organization. I could improve error logging and enhance the Views to handle dependency injection more efficiently. Also could spend more time making the UX/UI better.

### Additional Information: It was a fun project overall. I love companies that prioritize hiring developers who stay up to date with practices, it's a good sign of a great workplace. During this project, I got to explore Swift Testing over XCTest, and I found it to be much simpler and efficient to use.
