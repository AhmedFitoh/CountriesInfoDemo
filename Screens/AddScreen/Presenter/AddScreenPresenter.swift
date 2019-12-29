//
//  AddScreenPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class AddScreenPresenter {
    
    // MARK: - VIPER Stack
    weak var view: AddScreenPresenterToViewProtocol!
    var interactor: AddScreenPresenterToInteractorProtocol!
    var wireframe: AddScreenPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: AddScreenDelegate?
    
    // MARK: - Life Cycle
    init(wireframe: AddScreenPresenterToWireframeProtocol, view: AddScreenPresenterToViewProtocol, interactor: AddScreenPresenterToInteractorProtocol, delegate: AddScreenDelegate? = nil) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }
}

// MARK: - Interactor to Presenter Protocol
extension AddScreenPresenter: AddScreenInteractorToPresenterProtocol {
    func unexpectedErrorOccurred() {
            view.showUnexpectedErrorAlert()
            view.loadingIndicator(isHidden: true)
     }
    
    func searchSucceeded(With list: Countries) {
            view.showCountries(list: list)
            view.loadingIndicator(isHidden: true)
    }
}

// MARK: - View to Presenter Protocol
extension AddScreenPresenter: AddScreenViewToPresenterProtocol {
    func userSelected(country: Country) {
        interactor.saveChangesFor(country: country)
    }
    
    func searchInputHasChanged(to searchText: String) {
         view.loadingIndicator(isHidden: false)
         interactor.requestCountries(containText: searchText)
    }
    
    
}
