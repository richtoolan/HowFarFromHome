//
//  VariableKMMapView.swift
//  2KMFromHome
//
//  Created by Richard Toolan on 26/04/2020.
//  Copyright © 2020 Richard Toolan. All rights reserved.
//

import SwiftUI
import MapKit

struct VariableKMMapView: UIViewRepresentable {
    @Binding var located : Bool
    @Binding var location : CLLocation
    @Binding var distance : Float
    @Binding var mapCentre : CLLocation
    @Binding var customLocations : [CLLocation]
    @State var map = MKMapView()
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        map.showsUserLocation = true
        map.userTrackingMode = .none
        
        
        let isLocationSet = self.location.coordinate.latitude != 0.0
        
        var countOfOverlays = isLocationSet ? 1 : 0
        countOfOverlays += self.customLocations.count
        
        if(countOfOverlays != map.overlays.count){
            map.removeOverlays(map.overlays)
        }

        if(isLocationSet) {
            updateHome(location: self.location)
        }
        
        if(self.customLocations.count > 0) {
            self.customLocations.forEach { (location) in
                updateHome(location: location)
            }
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        return map
    }
    
    func makeCoordinator() -> VariableKMMapViewCoordinator {
        return VariableKMMapViewCoordinator(mapView: self)
    }
    
    func updateHome(location: CLLocation) {
        map.addOverlay(MKCircle(center:
            location.coordinate, radius: Double(self.distance) * 1000.0))
    }
}
