//
//  HomeScreenPresenter.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class HomeScreenPresenter {
    
    // MARK: - VIPER Stack
    weak var view: HomeScreenPresenterToViewProtocol!
    var interactor: HomeScreenPresenterToInteractorProtocol!
    var wireframe: HomeScreenPresenterToWireframeProtocol!
    
    // MARK: - Instance Variables
    weak var delegate: HomeScreenDelegate?
    
    // MARK: - Life Cycle
    init(wireframe: HomeScreenPresenterToWireframeProtocol, view: HomeScreenPresenterToViewProtocol, interactor: HomeScreenPresenterToInteractorProtocol, delegate: HomeScreenDelegate? = nil) {
        self.wireframe = wireframe
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }
}

// MARK: - Interactor to Presenter Protocol
extension HomeScreenPresenter: HomeScreenInteractorToPresenterProtocol {
    
}

// MARK: - View to Presenter Protocol
extension HomeScreenPresenter: HomeScreenViewToPresenterProtocol {
    func userDidPressAdd() {
        wireframe.openAddScreen()
    }
    
    
}