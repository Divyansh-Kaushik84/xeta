//
//  Facts.swift
//  xeta
//
//  Created by Divyansh Kaushik on 28/07/24.
//

import SwiftUI

struct Facts: View {
    let fact: String
    
    var body: some View {
        VStack {
            Text("Did you know?").font(.title2)
            Text(fact).padding(.horizontal).font(.title3).bold()
        }
        .frame(width: 350, height: 225)
        .background(Color(.orange))
        .foregroundColor(.white)
        .cornerRadius(20)
    }
}
//
//#Preview {
//    Facts()
//}
