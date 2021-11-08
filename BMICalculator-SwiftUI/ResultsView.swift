//
//  ResultsView.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 08.11.2021..
//

import SwiftUI


struct ResultsView: View {
    
    var height: Double
    var weight: Double
    
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
                Text("\(String(format: "%.2f", calculateBMI()))")
                    .font(.system(size: 68, weight: .heavy, design: .default))
                
                Spacer()
                
                Button {
                    isPresented = false
                } label: {
                    Text("RECALCULATE")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color("BMIPink"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(15)
        }
        
    }
    
    func calculateBMI() -> Double {
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(height: 0.0, weight: 0.0, isPresented: .constant(true))
    }
}
