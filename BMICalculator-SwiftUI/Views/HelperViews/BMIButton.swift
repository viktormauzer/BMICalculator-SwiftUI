//
//  SwiftUIView.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 08.11.2021..
//

import SwiftUI

struct BMIButton: View {
    
    let buttonText: String
    let buttonColor: String
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text("\(buttonText)")
                .font(.system(size: 18, weight: .semibold, design: .default))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color(buttonColor))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BMIButton(buttonText: "Calculate", buttonColor: "BMIPurple") {
            // do something
        }
    }
}
