//
//  BaseProtocol
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

@objc
protocol PresenterLifeCycleProtocol {

    @objc
    optional func loadView()

    @objc
    optional func viewDidLoad()

    @objc
    optional func viewWillAppear()

    @objc
    optional func viewDidAppear()

    @objc
    optional func didReceiveMemoryWarning()

    @objc
    optional func viewWillDisappear()

    @objc
    optional func viewDidDisappear()
}

protocol BasePresenterProtocol: class, PresenterLifeCycleProtocol {

}
