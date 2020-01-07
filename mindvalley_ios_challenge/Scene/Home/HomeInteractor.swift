//
//  HomeInteractor.swift
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import MindDownloader

class HomeInteractor {

    internal weak var presenter: HomeInteractorOutputProtocol?

    // MARK: - Custom Setter
    public func setPresenter (presenter: HomeInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorInputProtocol {
    func fetchBoardList() {
        let apicall = BoardServiceApiCall()
        apicall.getBoardData(completion: { (result: Result<[Board], Error>) in
            switch result {
            case .success(let homeBoard):
                self.presenter?.boardListFetchedSuccessfully(homeBoard)
            case .failure(let error):
                self.presenter?.boardListFetchedUnSuccessfully(title: "error", errorMessage: error.localizedDescription )
            }
        })
    }
    

}
