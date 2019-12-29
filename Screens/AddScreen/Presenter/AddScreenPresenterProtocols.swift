//
//  AddScreenPresenterProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol to the Module
protocol AddScreenDelegate: class {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol AddScreenInteractorToPresenterProtocol: class {
    func unexpectedErrorOccurred ()
    func searchSucceeded (With list: Countries)
}

// VIPER Protocol for communication from View -> Presenter
protocol AddScreenViewToPresenterProtocol: class {
    func searchInputHasChanged (to searchText: String)
    func userSelected (country: Country)
}
