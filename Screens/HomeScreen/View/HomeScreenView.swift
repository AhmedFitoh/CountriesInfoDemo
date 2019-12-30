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
    
    // MARK:- Instance Variables
    @IBOutlet weak var countriesTableView: UITableView!

    var countriesList: Countries = []
    let CellReuseIdentifier = "DefaultCellReuseIdentifier"
    
    // MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCoutriesTableView()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }

    private func setupCoutriesTableView () {
        countriesTableView.register(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
    }
    @IBAction func addAction(_ sender: Any) {
        presenter.userDidPressAdd()
    }
    
}

// MARK: - Presenter to View Protocol
extension HomeScreenView: HomeScreenPresenterToViewProtocol {
    func showCountries(list: Countries) {
        countriesList = list
        countriesTableView.reloadData()
    }
}


// MARK: - TableView data source delegate
extension HomeScreenView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier) ??  UITableViewCell ()
        cell.textLabel?.text = countriesList [indexPath.row].name
        return cell
    }
    
    
}

extension HomeScreenView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            presenter.userDidDeleted(country: countriesList [indexPath.row])
            countriesList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        countriesList [indexPath.row].userChoice.toggle()
//        tableView.reloadRows(at: [indexPath], with: .none)
//        presenter.userSelected(country: countriesList [indexPath.row])
//    }
}
