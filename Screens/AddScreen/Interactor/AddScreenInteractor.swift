//
//  AddScreenInteractor.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class AddScreenInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: AddScreenInteractorToPresenterProtocol!
    
}

// MARK: - Presenter To Interactor Protocol
extension AddScreenInteractor: AddScreenPresenterToInteractorProtocol {
    
}
