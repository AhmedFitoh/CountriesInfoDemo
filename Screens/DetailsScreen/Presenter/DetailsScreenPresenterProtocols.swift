//
//  DetailsScreenPresenterProtocols.swift
//
//  Created by AhmedFitoh on 12/30/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

// VIPER Protocol to the Module
protocol DetailsScreenDelegate: class {
    
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol DetailsScreenInteractorToPresenterProtocol: class {
    
}

// VIPER Protocol for communication from View -> Presenter
protocol DetailsScreenViewToPresenterProtocol: class {
    func viewDidFinishLoading ()
}
