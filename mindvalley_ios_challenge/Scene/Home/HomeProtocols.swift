//
//  HomeProtocols.swift
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol HomePresenterProtocol: BasePresenterProtocol {

    var interactor: HomeInteractorInputProtocol? { get set }

    /* ViewController -> Presenter */
    func getBoardList()
    var boardList: [Board] { get }
    func viewItemDetails(ofIndex: Int)
}

protocol HomeInteractorInputProtocol: class {

    var presenter: HomeInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
    func fetchBoardList()

}

// MARK: - Interactor -> Presenter

protocol HomeInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
    func boardListFetchedSuccessfully(_ boards: [Board])
    func boardListFetchedUnSuccessfully(title: String, errorMessage: String)
}

// MARK: - Presenter -> ViewController

protocol HomeViewProtocol: BaseViewProtocal {

    var presenter: HomePresenterProtocol? { get set }

    /* Presenter -> ViewController */
    func reloadData()

}

// MARK: - Router

protocol HomeWireframeProtocol: class {
    func NavigateToItemDetails(ofIndex: Int)
}
