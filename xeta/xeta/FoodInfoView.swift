import SwiftUI

struct FoodInfoView: View {
    @StateObject private var viewModel = FoodInfoViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView {
            if let foodData = viewModel.foodData {
                VStack(alignment: .leading) {
                    // Image and rating section
                    ZStack(alignment: .bottomLeading) {
                        ZStack {
                            if !foodData.image.isEmpty {
                                Image("biryani.png")
                                    .resizable()
                                    .frame(height: 400)
                            } else {
                                Color.gray.frame(height: 400)
                            }
                            Rectangle()
                                .opacity(0.25)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 400, height: 200)
                        }
                        .padding(.top, -60)
                        VStack(alignment: .leading) {
                            Text("Food Information")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.leading, .top, .trailing])
                            
                            Text(foodData.name)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.leading, .bottom, .trailing])
                                .padding(.top, 1)
                        }
                        .padding(.bottom, 10)
                        Rectangle()
                            .fill(Color(.gray))
                            .opacity(0.6)
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .padding(.leading, 275)
                            .padding(.bottom)
                        VStack {
                            Text(String(format: "%.0f", foodData.healthRating))
                                .font(.title)
                                .bold()
                                .padding(.top, 10)
                                .padding(.bottom, 10)
                            Text("out of 100").bold()
                        }
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .padding(.leading, 275)
                        .padding(.bottom, 20)
                    }
                    .navigationTitle("Back")
                    
                    // Description section
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text(foodData.description)
                            .font(.system(size: 17))
                            .padding(.top, 1)
                    }
                    .padding([.leading, .trailing])
                    
                    // Macro Nutrients section
                    VStack(alignment: .leading) {
                        Text("Macro Nutrients")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        NutritionFactsView(nutritionInfo: foodData.nutritionInfoScaled)
                            .padding(.top, 1)
                            .padding()
                    }
                    .padding([.leading, .trailing])
                    
                    // Facts section
                    VStack(alignment: .leading) {
                        Text("Facts")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(foodData.genericFacts, id: \.self) { fact in
                                    Facts(fact: fact)
                                }
                            }
                            .opacity(0.7)
                        }
                    }
                    .padding([.leading, .trailing])
                    
                    // Similar Items section
                    VStack(alignment: .leading) {
                        Text("Similar Items")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(foodData.similarItems, id: \.id) { item in
                                    SimilarItemView(name: item.name, imageName: item.image)
                                }
                            }
                            .padding(.leading)
                        }
                    }
                    .padding([.leading, .trailing, .bottom])
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)").onAppear {
                    viewModel.fetchFoodInfo()
                }
            } else {
                Text("Loading...").onAppear {
                    viewModel.fetchFoodInfo()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct FoodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfoView()
    }
}
