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
    func requestCountries (containText searchString: String) {
        
       guard let urlString = "https://restcountries.eu/rest/v2/name/\(searchString)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ,
                let url = URL(string: urlString) else {
                    presenter.unexpectedErrorOccurred()
                    return
                }
        
        
        let session = URLSession.shared
    
        session.dataTask(with: url) {[weak self] (data, urlResponse, error) in
                
                guard let data = data ,
                          error == nil ,
                          let response = urlResponse as? HTTPURLResponse else {
                            
                            self?.presenter.unexpectedErrorOccurred()
                            return
                          }
            
                    if response.statusCode == 404 {
                        // Nothing found
                        self?.presenter.searchSucceded(With: [])
                        return
                    }

                    if let countries = try? JSONDecoder().decode(Countries.self, from: data) {
                        self?.presenter.searchSucceded(With: countries)
                    } else {
                        self?.presenter.unexpectedErrorOccurred()
                    }
            
            
            
            }.resume()
        
    }
}
