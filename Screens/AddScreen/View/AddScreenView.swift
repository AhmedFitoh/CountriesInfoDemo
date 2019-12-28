//
//  AddScreenView.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class AddScreenView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: AddScreenViewToPresenterProtocol!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Presenter to View Protocol
extension AddScreenView: AddScreenPresenterToViewProtocol {
    
}
