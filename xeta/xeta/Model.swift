import Foundation

struct HomepageResponse: Codable {
    let success: Bool
    let data: HomepageData
    let message: String
}

struct HomepageData: Codable {
    let section1: Section1
    let section2: Section2
    let section3: Section3
    let section4: Section4
    
    enum CodingKeys: String, CodingKey {
        case section1 = "section_1"
        case section2 = "section_2"
        case section3 = "section_3"
        case section4 = "section_4"
    }
}

struct Section1: Codable {
    let planName: String
    let progress: String
    
    enum CodingKeys: String, CodingKey {
        case planName = "plan_name"
        case progress = "progress"
    }
}

struct Section2: Codable {
    let accuracy: String
    let workoutDuration: String
    let reps: Int
    let caloriesBurned: Int
    
    enum CodingKeys: String, CodingKey {
        case accuracy
        case workoutDuration = "workout_duration"
        case reps
        case caloriesBurned = "calories_burned"
    }
}

struct Section3: Codable {
    let plan1: Plan
    let plan2: Plan
    
    enum CodingKeys: String, CodingKey {
        case plan1 = "plan_1"
        case plan2 = "plan_2"
    }
}

struct Plan: Codable {
    let planName: String
    let difficulty: String
    
    enum CodingKeys: String, CodingKey {
        case planName = "plan_name"
        case difficulty
    }
}

struct Section4: Codable {
    let category1: Category
    let category2: Category
    
    enum CodingKeys: String, CodingKey {
        case category1 = "category_1"
        case category2 = "category_2"
    }
}

struct Category: Codable {
    let categoryName: String
    let noOfExercises: String
    
    enum CodingKeys: String, CodingKey {
        case categoryName = "category_name"
        case noOfExercises = "no_of_exercises"
    }
}
struct FoodInfo: Codable {
    let success: Bool
    let data: FoodData
}

struct FoodData: Codable {
    let id: String
    let apiName: [String]
    let badgeIndicator: String
    let creditsURL: String
    let cuisine: String
    let description: String
    let genericFacts: [String]
    let healthRating: Double
    let image: String
    let imageURL: String
    let ingredients: [Ingredient]
    let itemType: String
    let name: String
    let noOfServings: Double
    let nutritionFacts: String
    let nutritionInfoScaled: [NutritionInfo]
    let servingSizes: [ServingSize]
    let similarItems: [SimilarItem]
    let type: String
    let defaultUnitServing: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case apiName = "api_name"
        case badgeIndicator = "badge_indicator"
        case creditsURL = "credits_url"
        case cuisine
        case description
        case genericFacts = "generic_facts"
        case healthRating = "health_rating"
        case image = "image"
        case imageURL = "image_url"
        case ingredients
        case itemType = "itemtype"
        case name
        case noOfServings = "no_of_servings"
        case nutritionFacts = "nutrition_facts"
        case nutritionInfoScaled = "nutrition_info_scaled"
        case servingSizes = "serving_sizes"
        case similarItems = "similar_items"
        case type
        case defaultUnitServing = "default_unit_serving"
    }
}

struct NutritionInfo: Codable {
    let name: String
    let value: Double
    let units: String
}

struct SimilarItem: Codable {
    let id: String
    let name: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case image = "image"
    }
}

struct Ingredient: Codable {
    let ingid: String
    let name: String
    let value: Double
}

struct ServingSize: Codable {
    let units: String
    let name: String
    let value: Double
}
