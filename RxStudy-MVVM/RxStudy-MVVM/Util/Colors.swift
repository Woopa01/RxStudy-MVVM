//
//  Colors.swift
//  RxStudy-MVVM
//
//  Created by 조우진 on 25/04/2019.
//  Copyright © 2019 조우진. All rights reserved.
//

import Foundation
import UIKit

enum Color {
    case MAINBROWN
    
    func getColor() -> UIColor{
        switch self {
        case .MAINBROWN: return UIColor(red: 57/255, green: 36/255, blue: 22/255, alpha: 1)
       
        }
    }
}
