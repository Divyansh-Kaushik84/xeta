import SwiftUI

struct NutritionFactsView: View {
    let nutritionInfo: [NutritionInfo]
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 120)
                Text("Per Serve").bold().frame(width: 100, alignment: .center)
                Text("Per 250gm").bold().frame(width: 110, alignment: .center)
            }
            .font(.subheadline)
            .padding(.top, 5)
            
            Divider().foregroundColor(.black).background(Color(.black))
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(nutritionInfo, id: \.name) { info in
                    NutritionRow(name: info.name, perServe: "\(info.value) \(info.units)", per250gm: "\(info.value) \(info.units)")
                }
            }
            .font(.subheadline)
        }
        .frame(width: 300)
        .padding()
        .background(Color(red: 1, green: 0.3, blue: 0, opacity: 0.04))
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 2)
        )
    }
}
struct NutritionRow: View {
    let name: String
    let perServe: String
    let per250gm: String
    
    var body: some View {
        HStack {
            Text(name)
                .font(.caption)
                .bold()
                .frame(width: 100, alignment: .leading)
            Text(perServe)
                .font(.caption)
                .frame(width: 100, alignment: .center)
            Text(per250gm)
                .font(.caption)
                .frame(width: 100, alignment: .trailing)
        }
    }
}
//
//#Preview {
//    NutritionFactsView()
//}
