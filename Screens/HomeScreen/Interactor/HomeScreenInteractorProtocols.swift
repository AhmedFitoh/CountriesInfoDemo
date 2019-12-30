//
//  HomeScreenInteractorProtocols.swift
//
//  Created by AhmedFitoh on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol for communication from Presenter to Interactor
protocol HomeScreenPresenterToInteractorProtocol: class {
    func retriveSelectedCountries ()
    func deleteCountry (country: Country)
    func fetchDefaultCountry () 
}
