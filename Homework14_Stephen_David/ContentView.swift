//
// Assignment #14
// Stephen David
// Date: 2025-12-02
//


import SwiftUI

struct ContentView: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Image("myFavoritePlace")
                .resizable()
                .scaledToFit()
                .scaleEffect(scale)
            // Double-tap to zoom in
                .gesture(
                    TapGesture(count: 2)
                        .onEnded {
                            withAnimation {
                                scale += 0.2 // Zoom in
                            }
                        }
                )
            // Long-press to zoom out
                .gesture(
                    LongPressGesture()
                        .onEnded { _ in
                            withAnimation {
                                scale = max(1.0, scale - 0.2) // Zoom out (min scale = 1.0)
                            }
                        }
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

