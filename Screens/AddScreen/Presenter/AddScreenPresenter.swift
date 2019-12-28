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
        DispatchQueue.main.async { [weak self] in
            self?.view.showUnexpectedErrorAlert()
        }
    }
    
    func searchSucceded(With list: Countries) {
        DispatchQueue.main.async { [weak self] in
            self?.view.showCountries(list: list)
        }
    }
}

// MARK: - View to Presenter Protocol
extension AddScreenPresenter: AddScreenViewToPresenterProtocol {
    func userSelected(country: Country) {
        
    }
    
    func searchInputHasChanged(to searchText: String) {
         interactor.requestCountries(containText: searchText)
    }
    
    
}
