//
//  HomeImageView.swift
//  2KMFromHome
//
//  Created by Richard Toolan on 26/04/2020.
//  Copyright © 2020 Richard Toolan. All rights reserved.
//

import SwiftUI

struct HomeImageView: View {
    var body: some View {
        Image("home").resizable().frame(width: 64, height: 64, alignment: Alignment.center).clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 10)
    }
}

struct HomeImageView_Previews: PreviewProvider {
    static var previews: some View {
        HomeImageView()
    }
}
