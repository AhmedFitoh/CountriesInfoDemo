//
//  AddScreenInteractor.swift
//
//  Created by AhmedFitoh on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import Foundation

class AddScreenInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: AddScreenInteractorToPresenterProtocol!
    
    
    private func saveInLocalDatabase (countries: Countries) {
        guard !countries.isEmpty else {
            return
        }
        // check if remote countries has been selected by the user before
        let cache = CacheManager()
        
        let selectedCountries = cache.retiveAllUserChoices() ?? []
        // overwrite
        let readyToSaveCountries = countries.map { item -> Country in
            if selectedCountries.contains(item) {
                item.userChoice = true
            }
            return item
        }
        
        cache.saveDataLocaly(data: readyToSaveCountries)
    }
    private func searchInLocalDatabaseWith (text: String) {
         self.presenter.searchSucceeded(With:
            CacheManager().searchInDatabaseFor(text: text) ?? []
        )
    }
    
    private func requestCountriesOnlineWith (text: String) {
        guard let urlString = "https://restcountries.eu/rest/v2/name/\(text)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ,
            let url = URL(string: urlString) else {
                presenter.unexpectedErrorOccurred()
                return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) {[weak self] (data, urlResponse, error) in
            DispatchQueue.main.async {
                
                
                guard let data = data ,
                    error == nil ,
                    let response = urlResponse as? HTTPURLResponse else {
                        // An error occoured , search in local database
                        self?.searchInLocalDatabaseWith(text: text)
                        return
                }
                
                if response.statusCode == 404 {
                    // Nothing found
                    self?.presenter.searchSucceeded(With: [])
                    return
                }
                
                
                guard let self = self  else { return }
                let context = CacheManager.persistentContainer.newBackgroundContext()
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = context
                
                if let countries = try? decoder.decode(Countries.self, from: data) {
                    // Save data for offline usage
                    self.saveInLocalDatabase(countries: countries)
                    self.presenter.searchSucceeded(With: countries)
                } else {
                    // An error occoured , search in local database
                    self.searchInLocalDatabaseWith(text: text)
                }
                
            }
            }.resume()
    }
  
}

// MARK: - Presenter To Interactor Protocol
extension AddScreenInteractor: AddScreenPresenterToInteractorProtocol {
    func saveChangesFor(country: Country) {
        CacheManager().saveDataLocaly(data: [country])
    }
    
    
    func requestCountries (containText searchString: String) {
        requestCountriesOnlineWith(text: searchString)
    }
}
