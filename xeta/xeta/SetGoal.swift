import SwiftUI



struct ContentView: View {
    @State private var showSecondScreen = false
    @StateObject private var viewModel = HomepageViewModel()
    @State var caloriesBurned: Int

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // AScreen
                AScreen(showSecondScreen: $showSecondScreen, caloriesBurned: caloriesBurned)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showSecondScreen ? -geometry.size.width : 0)
                    .animation(.easeInOut)

                // BScreen
                BScreen(showSecondScreen: $showSecondScreen)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showSecondScreen ? 0 : geometry.size.width)
                    .animation(.easeInOut)

                // Navigation Dots
                VStack {
                    Spacer()
                    HStack {
                        Circle()
                            .fill(self.showSecondScreen ? Color.gray : Color.orange)
                            .frame(width: 10, height: 10)
                        Circle()
                            .fill(self.showSecondScreen ? Color.orange : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                    .padding(.top, 440)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct AScreen: View {
    @Binding var showSecondScreen: Bool
    var caloriesBurned: Int  // Add this property

    var body: some View {
        VStack {
            SetGoal(showSecondScreen: $showSecondScreen, caloriesBurned: caloriesBurned, dietPoints: 0.7, exercisePoints: 0.5)  // Sample values for progress
        }
    }
}

struct BScreen: View {
    @Binding var showSecondScreen: Bool

    var body: some View {
        VStack {
            Text("B Screen")
            Button(action: {
                self.showSecondScreen.toggle()
            }) {
                Button(action: {
                    self.showSecondScreen.toggle()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.orange)
                        .font(.title2)
                }
                .padding(.trailing, 300)
            }
        }
    }
}

struct SetGoal: View {
    @Binding var showSecondScreen: Bool
    var caloriesBurned: Int  // Add this property
    var dietPoints: CGFloat  // Progress for diet points
    var exercisePoints: CGFloat  // Progress for exercise points

    var formattedDate: String {
        let date = Date()
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        let dayOfWeek = dayFormatter.string(from: date)
        
        let dayNumberFormatter = DateFormatter()
        dayNumberFormatter.dateFormat = "d"
        let dayNumber = dayNumberFormatter.string(from: date)
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMM"
        let month = monthFormatter.string(from: date)
        
        return "\(dayOfWeek), \(dayNumber) \(month)"
    }

    var body: some View {
        VStack {
            Text("Today").font(.title2).bold()
            Text(formattedDate).foregroundColor(.gray)
                .padding(.bottom, 30)
            ZStack {
                Circle()
                    .stroke(lineWidth: 8)
                    .foregroundColor(.orange)
                    .opacity(0.5)
                    .frame(width: 200, height: 200)
                ProgressCircle(progress: dietPoints)
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .foregroundColor(.orange)
                    .frame(width: 200, height: 200)
                Circle()
                    .stroke(lineWidth: 8)
                    .foregroundColor(.purple)
                    .opacity(0.6)
                    .frame(width: 150, height: 150)
                ProgressCircle(progress: exercisePoints)
                    .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .foregroundColor(.purple)
                    .frame(width: 150, height: 150)
                Text("SET GOAL!")
                    .font(.title2)
                    .bold()
                Button(action: {
                    self.showSecondScreen.toggle()
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.orange)
                        .font(.title2)
                }
                .padding(.leading, 300)
            }
            HStack {
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.orange)
                Text("Diet Pts")
                    .fontWeight(.medium)
                    .padding(.trailing, 10)
                Image(systemName: "person.circle.fill")
                    .foregroundColor(.purple)
                Text("Exercise Pts")
                    .fontWeight(.medium)
            }
            .padding(.vertical, 5)
            HStack(alignment: .center) {
                VStack {
                    Text("\(caloriesBurned)")  // Use the passed value
                        .padding(.bottom, 5)
                        .opacity(0.6)
                        .foregroundColor(.orange)
                    Text("Cal")
                }
                .padding(.horizontal)
                VStack {
                    Text("3/5")
                        .padding(.bottom, 5)
                        .opacity(0.6)
                        .foregroundColor(.orange)
                    Text("Days")
                }
                .padding(.horizontal)
                VStack {
                    Text("88")
                        .padding(.bottom, 5)
                        .opacity(0.6)
                        .foregroundColor(.orange)
                    Text("Health Score")
                }
            }
        }
        .padding(40)
        .frame(width: 350, height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(caloriesBurned: 100)
    }
}
