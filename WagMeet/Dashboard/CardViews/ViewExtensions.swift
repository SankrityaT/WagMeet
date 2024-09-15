//
//  ViewExtensions.swift
//  WagMeet
//
//  Created by Sankritya Thakur on 9/9/24.
//

import SwiftUI

// Extension for shadowOverlay modifier
extension View {
    func shadowOverlay<V: Shape>(
        xOffset: CGFloat = 9,
        yOffset: CGFloat = 10,
        lineWidth: CGFloat = 3,
        opacity: Double = 1,
        backgroundColor: Color = Color.gray, // Use Color.gray, Color.white, etc.
        needsBrightness: Bool = false,
        colorScheme: ColorScheme,
        needsStrokeColor: Bool = false,
        strokeColor: Color = .primary, // Use a valid Color like .primary
        content: V
    ) -> some View {
        modifier(
            ShadowView(
                xOffset: xOffset,
                yOffset: yOffset,
                lineWidth: lineWidth,
                opacity: opacity,
                backgroundColor: backgroundColor,
                needsBrightness: needsBrightness,
                colorScheme: colorScheme,
                needsStrokeColor: needsStrokeColor,
                strokeColor: strokeColor,
                content: content // Pass the correct content of type Shape
            )
        )
    }
}

// Define the custom view modifier for shadows
struct ShadowView<V: Shape>: ViewModifier {
    var xOffset: CGFloat
    var yOffset: CGFloat
    var lineWidth: CGFloat
    var opacity: Double
    var backgroundColor: Color
    var needsBrightness: Bool
    var colorScheme: ColorScheme
    var needsStrokeColor: Bool
    var strokeColor: Color
    let content: V
    
    func body(content: Content) -> some View {
        content
            .background(
                self.content
                    .fill(self.backgroundColor)
                    .brightness(needsBrightness ? 0.3 : 0)
            )
            .overlay(
                self.content
                    .stroke(self.needsStrokeColor ? self.strokeColor : Color.clear, lineWidth: lineWidth)
            )
            .shadow(color: Color.black.opacity(self.opacity), radius: lineWidth, x: xOffset, y: yOffset)
    }
}
