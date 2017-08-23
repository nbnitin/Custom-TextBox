//
//  OpenDatePicker.swift
//  CustomTextBoxes
//
//  Created by Nitin Bhatia on 23/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class OpenDatePicker: UITextField,UITextFieldDelegate {
    
   
    var eventStartDate : UIDatePicker! = nil

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.delegate = self
        initiateTextBox()
        
        
        
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        
    }
    
  
   func initiateTextBox(){
    
    eventStartDate = UIDatePicker(frame: CGRect(x:0, y:40, width:0, height:0))
    eventStartDate.datePickerMode = UIDatePickerMode.date
    eventStartDate.addTarget(self, action: #selector(getDate), for: .valueChanged)
    
   let toolBar = UIToolbar()
    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor(red: 96/255, green: 122/255, blue: 146/255, alpha: 1)
    toolBar.sizeToFit()
    
    let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(closePicker))
    
    
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
    
    let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(closePicker))
    
    toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
    
    self.inputView = eventStartDate
    self.inputAccessoryView = toolBar

    
    }
    
    //Mark: Function to close pickerview
    func closePicker(){
        self.endEditing(true)
        
        if (self.text == "" || self.text == nil){
            let df = DateFormatter()
            df.dateFormat = "MM/dd/yyyy"
            let selectedDate = df.string(from: Date())
            self.text =  selectedDate
        }
    }
    
    
    
    func getDate(sender : UIDatePicker){
        
        if(sender == eventStartDate){
            let df = DateFormatter()
            df.dateFormat = "MM/dd/yyyy"
            let selectedDate = df.string(from: eventStartDate.date)
            self.text =  selectedDate
        }
    }
    
    
    
    
    
}
