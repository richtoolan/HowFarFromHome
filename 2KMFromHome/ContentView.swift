//
//  ContentView.swift
//  2KMFromHome
//
//  Created by Richard Toolan on 26/04/2020.
//  Copyright © 2020 Richard Toolan. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var located = false
    @State var location = CLLocation(
        latitude: 0.0, longitude: 0.0)
    @State var distance = Float(2.0)
    @State var locationManager = LocationManager()
    @State var showAlert = false
    @State var sliderValue = Float(0.0)
    @State var customLocations : [CLLocation]
    @State var mapCentre = CLLocation(
        latitude: 0.0, longitude: 0.0)
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center){
            Text("How far from home?")
                .font(.title)
                .fontWeight(.ultraLight)
                .foregroundColor(Style.Colors().darkPastelBlue)
            Spacer()
            VariableKMMapView(located: $located, location: $location, distance: $distance, mapCentre: $mapCentre, customLocations: $customLocations)
            DistanceSlider(value: $distance)
            Spacer()
            Button(
                action: { self.setLocation() },
                label: { Text(!self.located ? "🧭 Set home" : "Reset home") }
            ).buttonStyle(GradientButtonStyle(10.0))
            HStack(){
                Button(
                    action: { self.addCustomLocation() },
                    label:  {Text("Add other location")}
                ).buttonStyle(GradientButtonStyle(10.0))
                Button(
                    action: { self.removeLastCustomLocation() },
                    label:  {Text("Remove last location")}
                ).buttonStyle(GradientButtonStyle(10.0))
            }
            
            HStack(alignment: VerticalAlignment.center){
                Text("#StayHome")
                    .font(.footnote)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Style.Colors().darkPastelBlue)
                
            }
        }
    }
    
    func setLocation(){
        if(self.located){
            self.location = CLLocation(
                latitude: 0.0, longitude: 0.0)
            self.located = false
        } else {
            guard let loc = self.locationManager.lastLocation else {
                return
            }
            self.location = loc
            self.located = true
        }
    }
    
    func addCustomLocation() {
//        self.customLocations.append(CLLocation(latitude: self.mapCentre.coordinate.latitude, longitude: self.mapCentre.coordinate.longitude) )
        self.customLocations.append(self.mapCentre)
    }
    
    func removeLastCustomLocation() {
        if(self.customLocations.count > 0){ self.customLocations.removeLast()
        }
    }
    
    func toggleDistance(){
        if(self.distance == 2) {
            self.distance = 5
        } else {
            self.distance = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(customLocations: [])
    }
}

struct GradientButtonStyle: ButtonStyle {
    var padding : CGFloat
    init(_ padding: CGFloat) {
        self.padding = padding
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Style.Colors().lightPastelBlue)
            .padding(padding)
            .background(LinearGradient(gradient: Gradient(colors: [Style.Colors().fireRed, Style.Colors().fireRed]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}

