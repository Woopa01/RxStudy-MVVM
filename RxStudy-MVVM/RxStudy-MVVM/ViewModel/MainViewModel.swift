//
//  MainViewModel.swift
//  RxStudy-MVVM
//
//  Created by 조우진 on 25/04/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import RxAlamofire

class MainViewModel {
    let selectedItemIndex = BehaviorRelay<IndexPath>(value: IndexPath(row: 0, section: 0))
    let selectedItemName: Driver<String>

    var items : Driver<[historyModel]> = {
        return RxAlamofire.requestData(.get, "http://52.199.207.14/main/bla" , parameters: nil, encoding: URLEncoding.queryString, headers: ["ContentType" : "application/json"])
            .map({ res, Data -> [historyModel] in
                guard let data = try? JSONDecoder().decode([historyModel].self,from: Data) else {return []}
                return data
            }).asDriver(onErrorJustReturn: [])
    }()
    
    init() {
            selectedItemName = Observable.combineLatest(items.asObservable(), selectedItemIndex.asObservable()) { Items, index -> String in
                print(index.row)
                return Items[index.row].historicalSiteName
        }.asDriver(onErrorJustReturn: "")
    }
}
