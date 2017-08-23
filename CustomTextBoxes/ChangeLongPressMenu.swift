//
//  ChangeLongPressMenu.swift
//  CustomTextBoxes
//
//  Created by Nitin Bhatia on 23/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class ChangeLongPressMenu: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if(action == #selector(paste(_:))){
            return false
        }
        return true
    }

}
