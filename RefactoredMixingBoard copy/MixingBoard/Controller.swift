//
//  Controller.swift
//  MixingBoard
//
//  Created by Elizabeth Chiappini on 3/3/20.
//  Copyright © 2020 lizzychiappini. All rights reserved.
//

import SwiftUI

struct Signal {
    // Range: 0 - 10
    var intValue: Int
    // Range: 0 - 1.0
    var floatValue: Float
    // True or False
    var toggleValue: Bool
}

struct IntButton: View {
    @Binding var intValue: Int
    
    var body: some View {
        Button (action: {
            self.intValue = self.intValue + 1
            if self.intValue >= 9 {
                self.intValue = 1
            }
            print(self.intValue)
        }) {
            Text("SET \(intValue)")
                .font(.system(size: 30))
                .bold()
                .frame(width: 200, height: 100)
                .border(Color.gray, width: 3)
                .foregroundColor(Color.gray)
        }
    }
}

struct ShowButton: View {
    @Binding var toggleValue: Bool
    
    var body: some View {
        Button (action: {
            if self.toggleValue == false {
                self.toggleValue = true
            } else {
                self.toggleValue = false
            }
            // self.toggleValue = true
            print(self.toggleValue)
            
        }) {
            Text("SHOW")
                .font(.system(size: 30))
                .bold()
                .frame(width: 200, height: 100)
                .border(Color.gray, width: 3)
                .foregroundColor(Color.gray)
        }
    }
    
}

struct SliderButton: View {
    @Binding var colorSlide: Float
    var body: some View {
        VStack{
            Slider(value: $colorSlide, in: 0...1, step: 0.001)
            Text("COLOR")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(Color.gray)
        }
    }
    
}

struct Dots: View {
    @Binding var colorSlide: Float
    @Binding var toggleValue: Bool
    @Binding var intValue: Int
    var body: some View{
        VStack{
            if self.toggleValue == true {
                ForEach(0..<intValue, id: \.self) { _ in
                    Rectangle()
                        .fill(Color(red: Double(self.colorSlide), green: 200/255, blue: Double(self.colorSlide)))
                        .frame(width: 300, height: 50)
                }
            }
        }
    }
}

struct ResetButton: View {
    @Binding var toggleValue: Bool
    @Binding var intValue: Int
    var body: some View {
        
        Button (action: {
            self.toggleValue = false
            self.intValue = 0
        }) {
            Text("RESET")
                .font(.system(size: 30))
                .bold()
                .frame(width: 200, height: 100)
                .border(Color.gray, width: 3)
                .foregroundColor(Color.gray)
        }
    }
}


//struct Controller_Previews: PreviewProvider {
//    static var previews: some View {
//        Controller()
//    }
//}
