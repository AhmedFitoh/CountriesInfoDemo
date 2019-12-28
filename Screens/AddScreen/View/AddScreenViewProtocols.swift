//
//  AddScreenViewProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol for communication from Presenter -> View
protocol AddScreenPresenterToViewProtocol: class {
    func showUnexpectedErrorAlert ()
    func showCountries (list: Countries)
}
