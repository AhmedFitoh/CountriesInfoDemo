//
//  HomeScreenPresenter.swift
//
//  Created by AhmedFitoh on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation
import CoreLocation

class HomeScreenPresenter: NSObject {
    
    // MARK: - VIPER Stack
    weak var view: HomeScreenPresenterToViewProtocol!
    var interactor: HomeScreenPresenterToInteractorProtocol!
    var wireframe: HomeScreenPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: HomeScreenDelegate?
    var currentCountry: Country?
    let locationManager = CLLocationManager()
    
    // MARK: - Life Cycle
    init(wireframe: HomeScreenPresenterToWireframeProtocol, view: HomeScreenPresenterToViewProtocol, interactor: HomeScreenPresenterToInteractorProtocol, delegate: HomeScreenDelegate? = nil) {
        super.init()
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }
    private func setupLoactionManager() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
    }
    private func getUserDefaultCountry () {
        
        if (CLLocationManager.locationServicesEnabled())
        {
            let status = CLLocationManager.authorizationStatus()
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                setupLoactionManager()
            default:
                interactor.fetchDefaultCountry()
            }
        } else {
            interactor.fetchDefaultCountry()
        }
    }
}

// MARK: - Interactor to Presenter Protocol
extension HomeScreenPresenter: HomeScreenInteractorToPresenterProtocol {
    func defaultCountryFetched(country: Country) {
        view.addCountryOnTheTop(country: country)
    }
    
    func selectedCountriesRetrieved(list: Countries) {
        view.showCountries(list: list)
        if currentCountry == nil {
            getUserDefaultCountry()
        } else {
            view.addCountryOnTheTop(country: currentCountry!)
        }
    }
    
    
}

// MARK: - View to Presenter Protocol
extension HomeScreenPresenter: HomeScreenViewToPresenterProtocol {
    func userSelected(country: Country) {
        wireframe.openCountryDetailsScreen (with: country)
    }
    
    func userRequestedRemovalOf(country: Country) {
        interactor.deleteCountry(country: country)
    }
    
    func viewWillAppear() {
        // refresh selected list
        interactor.retriveSelectedCountries()
    }
    
    func userDidPressAdd() {
        wireframe.openAddScreen()
    }
    
    
}
// MARK: - Location delegate
extension HomeScreenPresenter: CLLocationManagerDelegate {

  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        guard let location = locations.last else {
            interactor.fetchDefaultCountry()
            return
        }
       extractInfoFromLoaction(location: location)
       manager.stopUpdatingLocation()
    }
    
    private func extractInfoFromLoaction (location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) {[weak self] placemark, error in
            guard error == nil,
                let placemark = placemark
                else
            {
                self?.interactor.fetchDefaultCountry()
                return
            }
            
            if !placemark.isEmpty , self?.currentCountry == nil {
                let place = placemark.first!
                guard let self = self else {
                    return
                }
                
                self.currentCountry = Country(name: place.country, capital: place.locality)
                self.view.addCountryOnTheTop(country: self.currentCountry!)
            }
            
        }
    }
}


