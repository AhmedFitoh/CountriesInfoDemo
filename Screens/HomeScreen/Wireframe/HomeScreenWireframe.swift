//
//  HomeScreenWireframe.swift
//
//  Created by AhmedFitoh on 12/27/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class HomeScreenWireframe {
    
    // MARK: - Instance Variables
    weak var viewController: UIViewController!
    // Uncomment to utilize a navigation contoller from storyboard
    // weak var navigationController: UINavigationController?
    
    // MARK:- Life cycle
    init(delegate: HomeScreenDelegate? = nil) {
        let storyboard = UIStoryboard(name: HomeScreenConstants.storyboardIdentifier, bundle: Bundle(for: HomeScreenWireframe.self))
        
        // Uncomment to utilize a navigation contoller from storyboard
        /*
        navigationController = storyboard.instantiateViewController(withIdentifier: HomeScreenConstants.navigationControllerIdentifier) as! UINavigationController
        let view = navigationController?.viewControllers[0] as! HomeScreenView
        */
        
        // Remove if used navigation controller from storyboard
        let view = (storyboard.instantiateViewController(withIdentifier: HomeScreenConstants.viewControllerIdentifier) as? HomeScreenView)!
        
        viewController = view
        
        let interactor = HomeScreenInteractor()
        let presenter = HomeScreenPresenter(wireframe: self, view: view, interactor: interactor, delegate: delegate)
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}

// MARK: - Presenter to Wireframe Protocol
extension HomeScreenWireframe: HomeScreenPresenterToWireframeProtocol {
    func openCountryDetailsScreen(with country: Country) {
        let detailsScreenWireframe = DetailsScreenWireframe(country: country)
        viewController.navigationController?.pushViewController(detailsScreenWireframe.viewController, animated: true)

    }
    
    func openAddScreen () {
        let addScreenWireframe = AddScreenWireframe()
        viewController.navigationController?.pushViewController(addScreenWireframe.viewController, animated: true)
    }
    
}
