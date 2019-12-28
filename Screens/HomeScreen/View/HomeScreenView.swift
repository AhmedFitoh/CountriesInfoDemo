//
//  HomeScreenView.swift
//  iOS-Viper-Architecture
//
//  Created by Nagwa on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class HomeScreenView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: HomeScreenViewToPresenterProtocol!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    @IBAction func addAction(_ sender: Any) {
        presenter.userDidPressAdd()
    }
    
}

// MARK: - Presenter to View Protocol
extension HomeScreenView: HomeScreenPresenterToViewProtocol {
    
}
