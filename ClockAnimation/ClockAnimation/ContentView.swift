//
//  ContentView.swift
//  ClockAnimation
//
//  Created by rutik maraskolhe on 23/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotateSeconds = false
    
    let phoneScreen = Color(red: 0, green: 0, blue: 0)
    @State private var dotOffset = false
    
    var body: some View {
            ZStack{
                phoneScreen
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 100) {
                    Text("Clock")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    ZStack {  // Path for positioning dots
                        Circle()
                            .stroke()
                            .frame(width: 300, height: 300)
                            .foregroundColor(.white)
                            .opacity(0)
                        
                        ForEach(0 ..< 60) {  // Small dots: Equal intervals
                            Circle()
                                .frame(width: 3, height: 3)
                                .foregroundColor(.white)
                                .offset(y: -150)
                                .rotationEffect(.degrees(Double($0) * 6))
                                .opacity(0.2)
                    }
                        ForEach(0 ..< 12) {  // Big dots: Equal intervals
                            Circle()
                                .frame(width: 6, height: 6)
                                .foregroundColor(.white)
                                .offset(y: -150)
                                .rotationEffect(.degrees(Double($0) * 30))
                        }
                        
                        Rectangle()  //  Minutes handle
                            .frame(width: 6, height: 120)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(0))
                            .cornerRadius(12)
                            .offset(y: -60)
                            
                        Rectangle()  //  Hours handle
                            .frame(width: 6, height: 80)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .rotationEffect(.degrees(45), anchor: .top)
                            .offset(y: 40)
                        
                        ZStack { // Seconds handle
                        Rectangle()
                            .frame(width: 200, height: 1)
                            .foregroundColor(.white)
                            .offset(x: 41)
                            
                        Circle()
                            .stroke()
                            .foregroundColor(.white)
                            .frame(width: 18, height: 18)
                            .offset(x: 150)
                            
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .offset(x: -57)
                        
                        }.rotationEffect(.degrees(rotateSeconds ? 360 : 0))
                            .animation(Animation.linear(duration: 36).repeatForever(autoreverses: false))
                         .onAppear() {
                                self.rotateSeconds.toggle()
                        }
                        
                        
                        Circle()  // Central point: Outer
                            .frame(width: 12, height: 12)
                            .foregroundColor(.white)
                            // Inner overlays
                            .overlay(Circle().frame(width: 8, height: 8).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 1, alpha: 1))))
                            .overlay(Circle().frame(width: 4, height: 4).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0.6274509804, alpha: 1))))
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

