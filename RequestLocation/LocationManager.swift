//
//  LocationManager.swift
//  RequestLocation
//
//  Created by Bo LeGrand on 4/21/21.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {

    static let shared = LocationManager()
    
    private var locationManager: CLLocationManager = CLLocationManager()
    private var requestLocationAuthorizationCallback: ((CLAuthorizationStatus) -> Void)?

    public func requestLocationAuthorization() {
        
        locationManager.delegate = self
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            print("Always")
        case .authorizedWhenInUse:
            print("When in use")
        case .denied:
            print("Denied")
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        default:
            break
        }

        if #available(iOS 13.4, *) {
            requestLocationAuthorizationCallback = { [self] status in
                if status != .authorizedAlways {
                    locationManager.requestAlwaysAuthorization()
                }
            }
            locationManager.requestWhenInUseAuthorization()
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    // MARK: - CLLocationManagerDelegate
    public func locationManager(_ manager: CLLocationManager,
                                didChangeAuthorization status: CLAuthorizationStatus) {
        requestLocationAuthorizationCallback?(status)
    }
}
