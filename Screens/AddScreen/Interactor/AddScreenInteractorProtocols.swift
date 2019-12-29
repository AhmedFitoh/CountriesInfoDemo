//
//  AddScreenInteractorProtocols.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol for communication from Presenter to Interactor
protocol AddScreenPresenterToInteractorProtocol: class {
    func requestCountries (containText searchString: String)
    func saveChangesFor (country: Country)
}
