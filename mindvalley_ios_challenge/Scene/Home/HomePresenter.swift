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

    init(interface: HomeViewProtocol,
         interactor: HomeInteractorInputProtocol?,
         router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension HomePresenter: HomePresenterProtocol {
    func getBoardList() {
        
    }
    
    var boardList: Board {
        
    }
    
    func viewItemDetails(ofIndex: Int) {
        
    }
    

}
extension HomePresenter: HomeInteractorOutputProtocol {
    func boardListFetchedSuccessfully(_ boards: Board) {
        
    }
    
    func boardListFetchedUnSuccessfully(title: String, errorMessage: String) {
        
    }
    

}
