//
//  AddScreenView.swift
//
//  Created by AhmedFitoh on 12/28/19.
//  Copyright © 2019 AhmedFitoh. All rights reserved.
//

import UIKit

class AddScreenView: UIViewController {
    
    // MARK: - VIPER Stack
    var presenter: AddScreenViewToPresenterProtocol!
    
    
    // MARK:- Instance Variables
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var countriesList: Countries = []
    let CellReuseIdentifier = "DefaultCellReuseIdentifier"
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    private func setupUI () {
        setupNavigationController ()
        setupCoutriesTableView ()
    }
    private func setupNavigationController () {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Add Countries"
        
        addSearchBar()

    }
    private func setupCoutriesTableView () {
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
    }
    private func addSearchBar () {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Country name"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
}

// MARK: - Presenter to View Protocol
extension AddScreenView: AddScreenPresenterToViewProtocol {
    func showCountries(list: Countries) {
        countriesList = list
        countriesTableView.reloadData()
    }
    
    func showUnexpectedErrorAlert() {
        let alertController = UIAlertController(title: nil, message: "Unexpected error occurred\nPlease try again later", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true)
    }
 
    func loadingIndicator (isHidden: Bool){
        UIApplication.shared.isNetworkActivityIndicatorVisible = !isHidden
    }
}


// MARK: - Search bar delegate
extension AddScreenView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searhText = searchController.searchBar.text ,
               !searhText.isEmpty {
            presenter.searchInputHasChanged(to: searhText)
        }
    }
}


// MARK: - TableView data source delegate
extension AddScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier) ??  UITableViewCell ()
        cell.textLabel?.text = countriesList [indexPath.row].name
        cell.accessoryType = countriesList [indexPath.row].userChoice ? .checkmark : .none
        return cell
    }
}

extension AddScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countriesList [indexPath.row].userChoice.toggle()
        tableView.reloadRows(at: [indexPath], with: .none)
        presenter.userSelected(country: countriesList [indexPath.row])
    }
}
