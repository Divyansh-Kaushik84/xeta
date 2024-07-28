import SwiftUI

struct ProgressCircle: Shape {
    var progress: CGFloat  // Progress as a percentage (0.0 to 1.0)
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.size.width, rect.size.height) / 2
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        let startAngle = CGFloat.pi / 2  // 270 degrees (bottom of the circle)
        let endAngle = startAngle + (2 * CGFloat.pi * progress)  // Draw clockwise
        
        var path = Path()
        path.addArc(center: center, radius: radius, startAngle: Angle(radians: Double(startAngle)), endAngle: Angle(radians: Double(endAngle)), clockwise: false)
        return path
    }
}
import SwiftUI

struct CustomButton: View {
    var label: String
    var progress: String
    var action: () -> Void

    private var progressValue: CGFloat {
        // Convert the progress string to a CGFloat value (e.g., "75%" -> 0.75)
        let value = progress.trimmingCharacters(in: CharacterSet(charactersIn: "%"))
        return CGFloat(Double(value) ?? 0) / 100.0
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Image("gym")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(label)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("Current Major Goal")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 40)
                
                ZStack {
                    ProgressCircle(progress: progressValue)
                        .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                        .foregroundColor(.orange)
                        .frame(width: 40, height: 40)
                    Text(progress)
                        .foregroundColor(.black)
                        .font(.caption2)
                }
            }
            .frame(width: 350, height: 75)
            .background(Color(.purple).opacity(0.075))
            .cornerRadius(10)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label: "abc", progress: "75%", action: {})
    }
}
