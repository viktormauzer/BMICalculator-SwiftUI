//
//  SliderWithLabel.swift
//  BMICalculator-SwiftUI
//
//  Created by Viktor Mauzer on 09.11.2021..
//

import SwiftUI

struct SliderWithLabel: View {
    
    @Binding var value: Double
    let unit: String
    let range: ClosedRange<Double>
    
    var body: some View {
        VStack {
            Text("\(String(format: "%.1f", value)) \(unit)")
            Slider(value: $value, in: range)
                .accentColor(Color("BMIPink"))
        }
    }
}

struct SliderWithLabel_Previews: PreviewProvider {
    static var previews: some View {
        SliderWithLabel(value: .constant(20.0), unit: "cm", range: 0...200)
    }
}
