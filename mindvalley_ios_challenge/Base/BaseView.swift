//
//  BaseViewProtocal
//  mindvalley_ios_challenge
//
//  Created Ahmed Samir on 1/5/20.
//  Copyright © 2020 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

@objc
protocol BaseViewProtocal: ViewIndicatorProtocal {

}

@objc
protocol ViewIndicatorProtocal: class {

    // MARK: - Load Indicator
    @objc
    optional func showLoadingIndicator()
    @objc
    optional func hideLoadingIndicator()
}


