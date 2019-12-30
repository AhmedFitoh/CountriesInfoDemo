//
//  HomeScreenViewProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol for communication from Presenter -> View
protocol HomeScreenPresenterToViewProtocol: class {
    func showCountries (list: Countries)
    func addCountryOnTheTop (country: Country)

}
