//
//  ContentView.swift
//  LiquidAnimation
//
//  Created by Jake Chang on 2024/6/7.
//

import SwiftUI

struct ContentView: View {
    
    @State var progress = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.black)
                .blur(radius: 20.0)
                .frame(width: 100.0, height: 100.0)
                .offset(x: progress * 80.0)
            Circle()
                .fill(.black)
                .blur(radius: 20.0)
                .frame(width: 100.0, height: 100.0)
                .offset(x: -progress * 80.0)
        }
        .frame(width: 500.0, height: 300.0)
        .overlay(
            Color(white: 0.5)
                .blendMode(.colorBurn)
        )
        .overlay(
            Color(white: 1.0)
                .blendMode(.colorDodge)
        )
        .overlay(
            LinearGradient(colors: [.purple, .red], startPoint: .leading, endPoint: .trailing)
            .blendMode(.plusLighter)
        )
        .onAppear {
            withAnimation(
                .easeInOut(duration: 1.0)
                .repeatForever()
            ) {
                progress = 1.0
            }
        }
    }
}

#Preview {
    ContentView()
}
