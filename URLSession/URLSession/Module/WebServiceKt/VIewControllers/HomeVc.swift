//
//  HomeVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 04/07/23.
//

import UIKit

class HomeVc: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var tblUserList: UITableView!
    @IBOutlet weak private var searchView: UISearchBar!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    // MARK: VARIABLE
    var viewModel = HomeViewModel()
    private var userList: [User?] = []
    private var filteredUserList: [User?] = []
    private var searchIsActive: Bool {
        return searchView.searchTextField.hasText
    }
    private var searchTimer: Timer?
    var coordinator: HomeCoordinator?
    
    // MARK: VIEWCONTROLLER LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        assignApiData()
        viewModel.getUsers()
    }
    
}

// MARK: TABLEVIEW DATASOURCE
extension HomeVc: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblUserList.dequeueReusableCell(withIdentifier: Constants.Cell.userTableViewCell) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(data: viewModel.userList.value[indexPath.row]) // viewmodel.users
        return cell
    }
    
}


// MARK: SEARCHBAR DELEGATE
extension HomeVc: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self] _ in
            self?.viewModel.filterUsers(searchQuery: searchText) //
            if (searchText.isEmpty) {
                self?.viewModel.isSearching = false
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

// MARK: TABLEVIEW DELEGATE
extension HomeVc: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let userProfileVc = storyboard?.instantiateViewController(
            withIdentifier: "ProfileVc") as? ProfileVc else {
            return
        }
        userProfileVc.userData = viewModel.userList.value[indexPath.row]
        navigationController?.pushViewController(userProfileVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.userList.value.count - 1,
           viewModel.currentPage.value < viewModel.totalPages.value && !viewModel.isSearching && !viewModel.isLoadingData.value {
            viewModel.getUsers()
        }
    }
    
}

// MARK: INITIAL SETUP
extension HomeVc {
    private func initValues() {
        tblUserList.delegate = self
        tblUserList.dataSource = self
        tblUserList.register(UINib(nibName: Constants.Cell.userTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.userTableViewCell)
        tblUserList.estimatedRowHeight = 60
        searchView.isUserInteractionEnabled = true
        searchView.delegate = self
        // Commenting this for need of showing nav bar
        // navigationController?.setNavigationBarHidden(true, animated: false)
        setUpLoader()
    }
    
    private func setUpLoader() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let self else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.loader.startAnimating()
                } else {
                    self.loader.stopAnimating()
                }
            }
        }
    }
}

// MARK: BIND DATA
extension HomeVc {
    private func assignApiData() {
        viewModel.userList.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tblUserList.reloadData()
            }
        }
    }
}
