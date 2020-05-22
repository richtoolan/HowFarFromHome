//
//  VariableKMMapViewCoordinator.swift
//  2KMFromHome
//
//  Created by Richard Toolan on 01/05/2020.
//  Copyright © 2020 Richard Toolan. All rights reserved.
//

import Foundation
import MapKit

//MARK: - Core Location manager delegate
class VariableKMMapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapView: VariableKMMapView
    
    init(mapView: VariableKMMapView) {
        self.mapView = mapView
        super.init()
        mapView.map.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = CircleRenderer(overlay: overlay)
        
        return circleRenderer
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        mapView.setRegion(MKCoordinateRegion(center: mapView.centerCoordinate, latitudinalMeters: CLLocationDistance((self.mapView.distance * 2000) + 500), longitudinalMeters: CLLocationDistance((self.mapView.distance * 2000) + 500)), animated: true)
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        self.mapView.mapCentre = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
    }
    
    class CircleRenderer: MKCircleRenderer {
        override func fillPath(_ path: CGPath, in context: CGContext) {
            let rect: CGRect = path.boundingBox
            context.addPath(path)
            context.clip()
            let gradientLocations: [CGFloat]  = [0.995, 1.0]
            let gradientColors: [CGFloat] = [1.0, 0.0, 0.0, 0.1,
                                             1.0, 0.0, 0.0, 0.9]
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            guard let gradient = CGGradient(colorSpace: colorSpace, colorComponents: gradientColors, locations: gradientLocations, count: 2) else { return }
            
            let gradientCenter = CGPoint(x: rect.midX, y: rect.midY)
            let gradientRadius = min(rect.size.width, rect.size.height) / 2
            context.drawRadialGradient(gradient, startCenter: gradientCenter, startRadius: 0, endCenter: gradientCenter, endRadius: gradientRadius, options: .drawsAfterEndLocation)
        }
    }
}
