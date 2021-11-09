//
//  ResultsView.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 08.11.2021..
//

import SwiftUI

struct ResultsView: View {
    
    var bmi: Double
    
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Image("BMICalculatorBG")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Your BMI is:")
                    .font(.system(size: 18, weight: .light, design: .default))
                    .foregroundColor(.black)
                Text("\(String(format: "%.1f", bmi))")
                    .font(.system(size: 68, weight: .heavy, design: .default))
                    .foregroundColor(.black)
                
                Spacer()
                
                BMIButton(buttonText: "RECALCULATE", buttonColor: "BMIPink") {
                    isPresented = false
                }
            }
            .padding(15)
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(bmi: 25.0, isPresented: .constant(true))
    }
}
