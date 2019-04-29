//
//  SecondVC.swift
//  RxStudy-MVVM
//
//  Created by 조우진 on 26/04/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SecondVC : UIViewController {
    @IBOutlet weak var siteName: UILabel!
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        viewModel.selectedItemName
        .drive(siteName.rx.text)
        .disposed(by: disposeBag)
    }
}
