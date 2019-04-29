//
//  ViewController.swift
//  RxStudy-MVVM
//
//  Created by 조우진 on 22/04/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MainVC : UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = false
        
        viewModel.items
            .drive(tableView.rx.items(cellIdentifier: "historicalCell", cellType: historicalSiteCell.self)) { _, model, cell in
                cell.historicalSiteName.text = model.historicalSiteName
                cell.historicalSiteLocation.text = model.historicalSiteLocation
                cell.historicalSiteImage.kf.setImage(with: URL(string: model.historicalSiteImagePath))
                cell.historicalSiteImage.addBlur()
                cell.selectionStyle = .none
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.bind(to: viewModel.selectedItemIndex).disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { indexPath in
            self.performSegue(withIdentifier: "goSecond", sender: nil)
        }).disposed(by: disposeBag)
        
    }
}


class historicalSiteCell : UITableViewCell {
    @IBOutlet weak var historicalSiteName: UILabel!
    @IBOutlet weak var historicalSiteLocation: UILabel!
    @IBOutlet weak var historicalSiteImage: UIImageView!
}
