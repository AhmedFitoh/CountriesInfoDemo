//
//  HomeScreenPresenterProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol to the Module
protocol HomeScreenDelegate: class {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol HomeScreenInteractorToPresenterProtocol: class {
    func selectedCountriesRetrieved (list: Countries)
}

// VIPER Protocol for communication from View -> Presenter
protocol HomeScreenViewToPresenterProtocol: class {
    func userDidPressAdd ()
    func viewWillAppear ()
    func userDidDeleted (country: Country)
}
