//
//  Problem2.swift
//  Discussion3
//
//  Created by Dylan Chhum on 2/18/25.
//

import SwiftUI


//Add a textfield to the Journal View
struct Journal: View {
    @State var text = ""
    var body: some View {
        VStack {
            ScrollView {
                HStack(alignment: .center) {
                    TextField("Vent", text: $text)
                        .bold()
                }
            }
            
        }
    }
}

//Fix the Valentine Struct to properly
// Reveal the Message DO NOT Spoil Yourself
// Add the proper variable to sheet to make
// the view work properly

struct Valentines: View {
    @State var isShown = false
    var body: some View {
        Heart(isShown: $isShown)
            .sheet(isPresented: $isShown , content: {
                Hidden()
            })
    }
       
        
//.toggle() is a modifier that changes a boolean from true to false and vice versa
    
    private struct Heart: View {
        @Binding var isShown: Bool
        var body: some View {
            Button {
                isShown.toggle()
            } label: {
               Text("Reveal the Message")
            }
        }
    }
    
    //Do not worry about this function
    private struct Hidden: View {
        @State private var scale: CGFloat = 1.0
        var body: some View {
            VStack {
                Text("🩷")
                    .font(.largeTitle)
                    .scaleEffect(scale)
                    .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.0)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) { scale = 1.5
                                    }
                                }
                Text("Will You Be My Valentine?")
            }
        }
    }
}

//To change the view you are looking at simply just change the struct name in the #Preview

#Preview {
    Valentines()
    Journal()
}
