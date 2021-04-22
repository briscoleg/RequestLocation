//
//  ViewController.swift
//  RequestLocation
//
//  Created by Bo LeGrand on 4/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    let locationButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.addTarget(self, action: #selector(locationButtonPressed), for: .touchUpInside)
        button.backgroundColor = .cyan
        button.setTitle("Request Location", for: .normal)
        return button
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        button.backgroundColor = .cyan
        button.setTitle("Open Settings", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    let locationManager = LocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(locationButton)
        view.addSubview(settingsButton)

        locationButton.center = view.center
        
        settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    @objc func locationButtonPressed() {
        
        LocationManager.shared.requestLocationAuthorization()
        
    }
    
    @objc func settingsButtonPressed() {
        
        if let appSettings = URL(string: UIApplication.openSettingsURLString + Bundle.main.bundleIdentifier!) {
            if UIApplication.shared.canOpenURL(appSettings) {
              UIApplication.shared.open(appSettings)
            }
         }
        
    }


}

