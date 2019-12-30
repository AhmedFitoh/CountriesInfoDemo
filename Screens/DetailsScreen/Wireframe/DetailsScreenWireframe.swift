//
//  DetailsScreenWireframe.swift
//
//  Created by AhmedFitoh on 12/30/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class DetailsScreenWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    // Uncomment to utilize a navigation contoller from storyboard
    // weak var navigationController: UINavigationController?
    
    // MARK:- Life cycle
    init(country: Country, delegate: DetailsScreenDelegate? = nil) {
        let storyboard = UIStoryboard(name: DetailsScreenConstants.storyboardIdentifier, bundle: Bundle(for: DetailsScreenWireframe.self))
        
        // Remove if used navigation controller from storyboard
        let view = (storyboard.instantiateViewController(withIdentifier: DetailsScreenConstants.viewControllerIdentifier) as? DetailsScreenView)!
        
        viewController = view
        
        let interactor = DetailsScreenInteractor()
        let presenter = DetailsScreenPresenter(wireframe: self,
                                               view: view,
                                               interactor: interactor,
                                               delegate: delegate,
                                               country: country)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension DetailsScreenWireframe: DetailsScreenPresenterToWireframeProtocol {
    
    
}
