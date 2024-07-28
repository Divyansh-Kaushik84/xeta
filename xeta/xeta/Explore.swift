import SwiftUI

struct CustomButtonExplore: View {
    var image: String
    var title: String
    var explain: String

    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 75)
            NavigationLink(destination: FoodInfoView()) {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.black)
                    Text(explain)
                        .font(.footnote)
                        .padding(.top, 1)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
            }
        }
    }
}

struct CustomButtonExplore_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonExplore(image: "sampleImage", title: "Sample Title", explain: "Sample explanation")
    }
}
