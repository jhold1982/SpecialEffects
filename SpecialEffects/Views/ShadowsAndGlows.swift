//
//  ShadowsAndGlows.swift
//  SpecialEffects
//
//  Created by Justin Hold on 4/12/23.
//

import SwiftUI

extension View {
	func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
		self
			.overlay(self.blur(radius: radius / 6 ))
			.shadow(color: color, radius: radius / 3)
			.shadow(color: color, radius: radius / 3)
			.shadow(color: color, radius: radius / 3)
	}
}

extension View {
	func multicolorGlow() -> some View {
		ForEach(0..<2) { i in
			Rectangle()
				.fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center))
				.frame(width: 400, height: 400)
				.mask(self.blur(radius: 20))
				.overlay(self.blur(radius: 5 - CGFloat(i * 5)))
		}
	}
}

extension View {
	func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
		let finalX = CGFloat(cos(angle.radians - .pi / 2))
		let finalY = CGFloat(sin(angle.radians - .pi / 2))
		return self
			.overlay(
				shape
					.stroke(color, lineWidth: width)
					.offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
					.blur(radius: blur)
					.mask(shape)
			)
	}
}

struct ShadowsAndGlows: View {
    var body: some View {
		ZStack {
			/// Glow Circle
//			Circle()
//				.fill(Color.white)
//				.frame(width: 300, height: 300)
//				.glow(color: .blue, radius: 36)
			/// Rainbow Hello, world
//			Text("Hello, world!")
//				.font(.system(size: 96, weight: .black, design: .rounded))
//				.foregroundColor(.white)
//				.multilineTextAlignment(.center)
//				.frame(width: 400, height: 300)
//				.multicolorGlow()
			/// Inner Shadow Circle
			Circle()
				.fill(Color.green)
				.frame(width: 300, height: 300)
				.innerShadow(using: Circle())
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color.white)
		.edgesIgnoringSafeArea(.all)
    }
}

struct ShadowsAndGlows_Previews: PreviewProvider {
    static var previews: some View {
        ShadowsAndGlows()
    }
}
