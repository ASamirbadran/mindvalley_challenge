//
//  HomeViewController.swift
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - Public Variables
    internal var presenter: HomePresenterProtocol?

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    @IBOutlet private weak var boardTableView: UITableView!
    // MARK: - Custom Setter
    public func setPresenter (presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - View controller lifecycle methods
extension HomeViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
    }
}

// MARK: - IBActions
extension HomeViewController {

}

// MARK: - Selectors
extension HomeViewController {

}

// MARK: - Private
extension HomeViewController {

}

// MARK: - Protocal
extension HomeViewController: HomeViewProtocol {
    func reloadData() {
        
    }
}
