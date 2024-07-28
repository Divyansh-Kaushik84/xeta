import SwiftUI

struct SecondScreen: View {
    @State private var minimumValue: Double = 0.0
    @State private var maximumValue: Double = 100.0
    @State private var value: Double = 50.0
    @State private var length: Double = 0.0
    
    var body: some View {
        VStack {
            Slider(value: $minimumValue, in: 0...maximumValue)
                .padding()
            
            Slider(value: $maximumValue, in: minimumValue...200)
                .padding()
            
            Slider(value: $value, in: minimumValue...maximumValue)
                .padding()
            
            Text("minimumValue: \(minimumValue)")
            Text("maximumValue: \(maximumValue)")
            Text("value: \(value)")
            
            let cc = CGFloat(Int(maximumValue) - Int(minimumValue))
            Text("cc = \(cc)")
            
            // Assuming 'length' is some calculated value based on your logic
            Text("length: \(length)")
            
            Spacer()
        }
        .padding()
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
