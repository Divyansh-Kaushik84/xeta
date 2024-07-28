import SwiftUI
import Combine

class HomepageViewModel: ObservableObject {
    @Published var homepageData: HomepageData?
    @Published var errorMessage: String?
    
    private var cancellable: AnyCancellable?
    
    func fetchHomepageData() {
        guard let url = URL(string: "http://52.25.229.242:8000/homepage_v2/") else {
            errorMessage = "Invalid URL"
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: HomepageResponse.self, decoder: JSONDecoder())
            .map { $0.data }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { data in
                self.homepageData = data
            })
    }
}

class FoodInfoViewModel: ObservableObject {
    @Published var foodData: FoodData?
    @Published var errorMessage: String?

    private var cancellable: AnyCancellable?

    func fetchFoodInfo() {
        guard let url = URL(string: "http://52.25.229.242:8000/food_info/") else {
            self.errorMessage = "Invalid URL"
            return
        }

        print("Fetching data from URL: \(url)")

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .handleEvents(receiveOutput: { data in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Received data: \(jsonString)")
                }
            })
            .decode(type: FoodInfo.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print("Error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { foodInfo in
                self.foodData = foodInfo.data
            })
    }
}
