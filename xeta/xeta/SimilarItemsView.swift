import SwiftUI
struct SimilarItemView: View {
    let name: String
    let imageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 175)
                .clipped()
                .cornerRadius(15)
            
            Text(name)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.top,120).bold()
            
                .lineLimit(1)
                .frame(width: 230)
        }
    }
}
#Preview{
SimilarItemView(name: "Chicken Tadka", imageName: "veg_biryani")
}
