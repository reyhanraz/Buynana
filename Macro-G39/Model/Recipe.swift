//
//  Recipe.swift
//  Macro-G39
//
//  Created by Muhammad Rivan Rayhan on 30/10/20.
//

import Foundation

class Recipe {
    struct RecipeInfo{
        var name: String
        var image: String
        var bananaType: String
        var ripeness: String
    }
    
    var arrRecipe:[RecipeInfo] = [
        RecipeInfo(name: "Pisang Goreng", image: "", bananaType: "Kepok", ripeness: "Matang"),
        RecipeInfo(name: "Bolu Pisang", image: "", bananaType: "Raja", ripeness: "Terlalu Matang"),
        RecipeInfo(name: "Keripik", image: "", bananaType: "Ambon", ripeness: "Matang"),
        RecipeInfo(name: "Banana Smoothie", image: "", bananaType: "Ambon", ripeness: "Matang"),
        RecipeInfo(name: "Banana Cake", image: "", bananaType: "Ambon", ripeness: "Terlalu Matang"),
        RecipeInfo(name: "Kolak Pisang", image: "", bananaType: "Tanduk", ripeness: "Matang"),
    ]
}
