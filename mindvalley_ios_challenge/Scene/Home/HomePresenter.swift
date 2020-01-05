//
//  HomePresenter.swift
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class HomePresenter: NSObject {

    private weak var view: HomeViewProtocol?
    internal var interactor: HomeInteractorInputProtocol?
    private var router: HomeWireframeProtocol?
    var boardItems = [Board]()

    init(interface: HomeViewProtocol,
         interactor: HomeInteractorInputProtocol?,
         router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension HomePresenter: HomePresenterProtocol {
    func viewItemDetails(ofIndex: Int) {
        router?.NavigateToItemDetails(ofIndex: ofIndex)
    }
    
   
    func getBoardList() {
        view?.showLoadingIndicator?()
        interactor?.fetchBoardList()
    }
    
    var boardList: [Board] {
         return boardItems
    }
    

}
extension HomePresenter: HomeInteractorOutputProtocol {
    func boardListFetchedSuccessfully(_ boards: [Board]) {
        view?.hideLoadingIndicator?()
        self.boardItems = boards
        view?.reloadData()
    }
    
    func boardListFetchedUnSuccessfully(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        //print or show error
        print(errorMessage)
    }
    

}
