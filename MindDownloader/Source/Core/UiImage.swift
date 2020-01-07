//
//  UiImage.swift
//  MindRemoteLoader
//
//  Created by Ahmed Samir on 1/5/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import UIKit
public extension UIImageView {
    func loadImageFromUrl(url : URL) {
        self.image = UIImage(named: "placeholder")
        ImageDownloader.shared.fetchImage(url: url, completion: { (result: Result<Data, CustomError>) in
            switch result {
            case.success(let data):
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.image = image
                }
            case.failure( _):
                debugPrint("Error Fetching Image With Url : \(url)")
            }
        })
    }
}
