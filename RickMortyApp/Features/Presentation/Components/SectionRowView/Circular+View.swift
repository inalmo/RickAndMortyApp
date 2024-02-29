//
//  Circular+View.swift
//  RickMortyApp
//
//  Created by Iñigo Alonso Molledo on 29/2/24.
//

import SwiftUI

struct CircularView: View {
    var value: CGFloat = 0.5
    var lineWidth: Double = 4
    
    @State var appear = false
    
    var body: some View {
        Circle()
            .trim(from: 0, to: appear ? value : 0)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .fill(.angularGradient(colors: [.purple, .orange, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
            .onAppear {
                withAnimation(.spring().delay(0.5)) {
                    appear = true
                }
            }
            .onDisappear {
                appear = false
            }
    }
}

