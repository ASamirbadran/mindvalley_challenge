//
//  BaseViewController.swift
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Public Variables

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /// use this if you add a ViewControllerScene to the Nib not a View
    static func loadViewControllerFromXib<Controller: BaseViewController>() -> Controller {
        let nib = UINib(nibName: String(describing: self), bundle: Bundle.main)
        guard let controller = nib.instantiate(withOwner: nil, options: nil).first as? Controller
            else {
                fatalError("failed to parse top level object in nib to \(String(describing: Controller.self))")
        }
        return controller
    }


}

extension BaseViewController: ViewIndicatorProtocal {

    func showLoadingIndicator() {
        Loader.show(onView: view)
    }

    func hideLoadingIndicator() {
        Loader.hide()
    }
}
