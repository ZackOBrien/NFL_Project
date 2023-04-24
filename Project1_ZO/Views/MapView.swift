//
//  MapView.swift
//  Project1_ZO
//
//  Created by Zack O'Brien on 10/30/22.
//

import SwiftUI

import MapKit


struct MyView: UIViewRepresentable {
    @EnvironmentObject var VM: ViewModel
    var stadium = Stadium()
    
    var region : MKCoordinateRegion{
        get{
            let temp = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: stadium.latitude, longitude: stadium.longitude), span: MKCoordinateSpan(latitudeDelta: 0.0059, longitudeDelta: 0.0059))
            return temp
        }
    }
    
    var point_of_interest : [MKPointAnnotation] {
        var locs = [MKPointAnnotation]()
        let loc = MKPointAnnotation()
        loc.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = stadium.name
        locs.append(loc)
        return locs
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
            let map = MKMapView()
//        map.addAnnotations(point_of_interest)
        map.delegate = context.coordinator
        return map
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(point_of_interest)
        
        
        uiView.setRegion(region, animated: true)
    }
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // return the delegate
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self)
    }
    class Coordinator : NSObject, MKMapViewDelegate {
        
        var map : MyView
        
        init(map : MyView) {
            self.map = map
        }
        
        // Button ()
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            return annotationView

        }
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        }
    }
}

struct MapView : View {
    @EnvironmentObject var VM: ViewModel
    var stadium = Stadium()
    
    var body : some View {
        MyView(stadium: stadium)
            .ignoresSafeArea()
            .environmentObject(ViewModel())
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyView()
//            .ignoresSafeArea()
//            .environmentObject(ViewModel())
//    }
//}
