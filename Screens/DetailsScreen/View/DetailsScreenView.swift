//
//  DetailsScreenView.swift
//
//  Created by AhmedFitoh on 12/30/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class DetailsScreenView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: DetailsScreenViewToPresenterProtocol!
    
    // MARK:- Instance Variables
    
    @IBOutlet weak var countryDetailLabel: UILabel!
    @IBOutlet weak var capitalDetailLabel: UILabel!
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidFinishLoading ()
    }
}

// MARK: - Presenter to View Protocol
extension DetailsScreenView: DetailsScreenPresenterToViewProtocol {
    func setCountry(country: Country) {
        countryDetailLabel.text = country.name
        capitalDetailLabel.text = country.capital

    }
}
