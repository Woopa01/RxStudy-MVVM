//
//  Shape.swift
//  RxStudy-MVVM
//
//  Created by 조우진 on 25/04/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

class NavigationShape : UINavigationController {
    override func viewDidLoad() {
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = Color.MAINBROWN.getColor()
        navigationBar.topItem?.title = "블라디보스토크"
        navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
    }
}

class dynamicTableView: UITableView {
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}
