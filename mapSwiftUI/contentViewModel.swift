//
//  contentViewModel.swift
//  mapSwiftUI
//
//  Created by BJIT on 25/5/22.
//
import MapKit

enum detailMap{
    static let startLocDefault = CLLocationCoordinate2D(latitude: 23.8001, longitude: 90.4628)
    static let spanDefault = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}
final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: detailMap.startLocDefault, span: detailMap.spanDefault) //Lat, Lon of BJIT, Bangladesh
    var locationManager: CLLocationManager?
    func checkIfLocServiceEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }
        else{
            print("show an alert about location is off now")
        }
    }
    //unwrapper function for location manager
    private func checkLocAuthorized() {
        guard let locmanager = locationManager else {
            return
        }
        switch locmanager.authorizationStatus {
        case .notDetermined:
            locmanager.requestWhenInUseAuthorization()
        case .restricted:
            print("location restricted")
        case .denied:
            print("go to settings")
        case .authorizedAlways, .authorizedWhenInUse:
            //region = MKCoordinateRegion(center: locmanager.location?.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            break
        @unknown default:
            break
        }
    }

    // check after notifcation
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocAuthorized()
    }
}
