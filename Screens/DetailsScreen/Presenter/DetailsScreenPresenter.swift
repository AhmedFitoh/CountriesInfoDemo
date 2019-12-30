//
//  DetailsScreenPresenter.swift
//
//  Created by AhmedFitoh on 12/30/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class DetailsScreenPresenter {
    
    // MARK: - VIPER Stack
    weak var view: DetailsScreenPresenterToViewProtocol!
    var interactor: DetailsScreenPresenterToInteractorProtocol!
    var wireframe: DetailsScreenPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: DetailsScreenDelegate?
    let country: Country!
    // MARK: - Life Cycle
    init(wireframe: DetailsScreenPresenterToWireframeProtocol,
         view: DetailsScreenPresenterToViewProtocol,
         interactor: DetailsScreenPresenterToInteractorProtocol,
         delegate: DetailsScreenDelegate? = nil,
         country: Country) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
        self.country = country
    }
}

// MARK: - Interactor to Presenter Protocol
extension DetailsScreenPresenter: DetailsScreenInteractorToPresenterProtocol {
    
}

// MARK: - View to Presenter Protocol
extension DetailsScreenPresenter: DetailsScreenViewToPresenterProtocol {
    func viewDidFinishLoading() {
        view.setCountry(country: country)
    }
    
    
}
