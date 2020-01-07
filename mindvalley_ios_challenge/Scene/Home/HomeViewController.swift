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
        setupTableView()
        presenter?.getBoardList()

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
    func setupTableView() {
           boardTableView.delegate = self
           boardTableView.dataSource = self
           boardTableView.register(
               UINib (nibName: BoardItemTableViewCell.className, bundle: Bundle(for: BoardItemTableViewCell.self)),
               forCellReuseIdentifier: BoardItemTableViewCell.className)
           
           boardTableView.rowHeight = 130
           boardTableView.separatorStyle = .none
       }
}

// MARK: - Protocal
extension HomeViewController: HomeViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.boardTableView.reloadData()
        }

    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter?.boardList.count ?? 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BoardItemTableViewCell.className,
            for: indexPath) as? BoardItemTableViewCell else {
                fatalError("BoardItemTableViewCell")
        }
        let row = indexPath.row
        if let boardCellData = presenter?.boardList[row] {
            cell.configureCell(boardCell: boardCellData)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.viewItemDetails(ofIndex: indexPath.row)
    }
    
}
