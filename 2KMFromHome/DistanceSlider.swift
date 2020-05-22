//
//  DistanceSlider.swift
//  2KMFromHome
//
//  Created by Richard Toolan on 02/05/2020.
//  Copyright © 2020 Richard Toolan. All rights reserved.
//

import SwiftUI

struct DistanceSlider: View {
    @Binding var value : Float
    
    var body: some View {
        return Slider(value: $value, in: ClosedRange(uncheckedBounds: (lower: 2.0, upper: 20.0)), step: 3.0, onEditingChanged: { (changed) in
            return
        }, minimumValueLabel: Text("2km"), maximumValueLabel: Text("20km")) {
            return Text("Toggle the distance")
        }.accentColor(Style.Colors().fireRed)
    }
    
}

//struct DistanceSlider_Previews: PreviewProvider {
//    @State var value : Float = 1.0
//
//    static var previews: some View {
//        DistanceSlider(value: $value)
//    }
//}
