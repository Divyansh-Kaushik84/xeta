import SwiftUI

struct FirstScreen: View {
    @StateObject private var viewModel = HomepageViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if let data = viewModel.homepageData {
                        ContentView(caloriesBurned: data.section2.caloriesBurned)

                        Text("Your Goals")
                            .font(.title3).bold()
                            .padding(.vertical, 20)
                            .padding(.top,220)
                        
                        CustomButton(label: data.section1.planName,progress: data.section1.progress, action: {})
                        
                        Text("Explore")
                            .font(.title3).bold()
                            .padding(.vertical, 20)
                        
                        CustomButtonExplore(image: "diet", title: "Find Diets", explain: "Find premade diets according to your cusine")
                        CustomButtonExplore(image: "nutritionist", title: "Find Nutrientionist", explain: "Get customized diets to achieve your health goal")
                    } else if let errorMessage = viewModel.errorMessage {
                        Text("Error: \(errorMessage)")
                    } else {
                        ProgressView()
                            .onAppear {
                                viewModel.fetchHomepageData()
                            }
                    }
                }
                .padding(.top, 200)
            }
            .padding()
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("DietSnap")
                            .foregroundColor(.yellow)
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                }
            }
            .navigationBarItems(trailing: HStack {
                Button(action: {
                    // Action for bell icon
                }) {
                    Image("bell")
                        .resizable()
                        .frame(width: 22, height: 25)
                }
                Button(action: {
                    // Action for medal icon
                }) {
                    Image("achievement")
                        .resizable()
                        .frame(width: 18, height: 25)
                }
                Button(action: {
                    // Action for chat icon
                }) {
                    Image("message")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .overlay(
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.gray).opacity(0.3)
                .padding(.top, 35),
            alignment: .top
        )
    }
}
