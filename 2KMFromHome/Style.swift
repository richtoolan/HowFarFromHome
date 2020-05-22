//
//  File.swift
//  2KMFromHome
//
//  Created by Richard Toolan on 01/05/2020.
//  Copyright © 2020 Richard Toolan. All rights reserved.
//

import Foundation
import SwiftUI

struct Style {
    struct Colors {
        let fireRed = rgb(238, 108, 77)
        let darkGrey = rgb(41, 50, 65)
        let lightPastelBlue = rgb(224, 251, 252)
        let darkPastelBlue = rgb(152, 193, 217)
        let darkBlue = rgb(61, 90, 128)
    }
}

func rgb(_ red: Double, _ green: Double, _ blue: Double) -> Color {
    return Color(red:(1/255.0)*red, green:(1/255.0)*green, blue:(1/255.0)*blue)
}
