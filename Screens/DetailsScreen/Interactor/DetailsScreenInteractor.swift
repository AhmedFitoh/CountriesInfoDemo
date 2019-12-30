//
//  DetailsScreenInteractor.swift
//
//  Created by AhmedFitoh on 12/30/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class DetailsScreenInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: DetailsScreenInteractorToPresenterProtocol!
    
}

// MARK: - Presenter To Interactor Protocol
extension DetailsScreenInteractor: DetailsScreenPresenterToInteractorProtocol {
    
}
