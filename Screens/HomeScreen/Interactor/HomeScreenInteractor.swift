//
//  HomeScreenInteractor.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class HomeScreenInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: HomeScreenInteractorToPresenterProtocol!
    
}

// MARK: - Presenter To Interactor Protocol
extension HomeScreenInteractor: HomeScreenPresenterToInteractorProtocol {
    func fetchDefaultCountry() {
        presenter.defaultCountryFetched(country: Country(name: "Egypt", capital: "Cairo"))
    }

    func deleteCountry(country: Country) {
        CacheManager().deleteCountry(country: country)
    }
    
    func retriveSelectedCountries() {
        presenter.selectedCountriesRetrieved(list:  CacheManager().retiveAllUserChoices() ?? [] )
    }
    
    
}
