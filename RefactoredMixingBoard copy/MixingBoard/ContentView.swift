//
//  ContentView.swift
//  MixingBoard
//
//  Created by Elizabeth Chiappini on 3/1/20.
//  Copyright © 2020 lizzychiappini. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var signal: Signal = Signal(intValue: 0, floatValue: 1.0, toggleValue: false)
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    IntButton(intValue: $signal.intValue)
                    ShowButton(toggleValue: $signal.toggleValue)
                }
                
                SliderButton(colorSlide: $signal.floatValue)
                
                Dots (colorSlide: $signal.floatValue, toggleValue: $signal.toggleValue, intValue: $signal.intValue)
                Spacer()

                ResetButton (toggleValue: $signal.toggleValue, intValue: $signal.intValue)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
