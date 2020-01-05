//
//  HomeRouter.swift
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class HomeRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HomeViewController(nibName: nil, bundle: nil)
        let interactor = HomeInteractor()
        let router = HomeRouter(with: view)
        let presenter = HomePresenter(interface: view, interactor: interactor, router: router)

        view.setPresenter (presenter: presenter)
        interactor.setPresenter (presenter: presenter)

        return view
    }
}

extension HomeRouter: HomeWireframeProtocol {
    func viewItemDetails(ofIndex: Int) {
        
    }
}
