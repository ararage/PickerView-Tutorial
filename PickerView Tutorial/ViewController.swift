//
//  ViewController.swift
//  PickerView Tutorial
//
//  Created by Ricardo Perez on 1/4/17.
//  Copyright © 2017 Ricardo Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var lblPickerChoiceOUTLET: UILabel!
    @IBOutlet weak var pkrPickerOUTLET: UIPickerView!
   
    //var pickerDataSource : [String] = []
    
    var pickerDataSource = [
                                        ["Red",
                                        "Blue",
                                        "Green",
                                        "Yellow",
                                        "Black",
                                        "White",
                                        "Brown"]
                                        ,
                                        ["Red",
                                        "Blue",
                                        "Green"]
                                       ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pkrPickerOUTLET.delegate = self
        self.pkrPickerOUTLET.dataSource = self
        
        /*pickerDataSource = ["Red",
                            "Blue",
                            "Green",
                            "Yellow",
                            "Black",
                            "White",
                            "Brown"]*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //return 1
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return pickerDataSource.count
        return pickerDataSource[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return pickerDataSource[row]
        return pickerDataSource[component][row]

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            switch row {
            case 0:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][0]
            case 1:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][1]
            case 2:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][2]
            case 3:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][3]
            case 4:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][4]
            case 5:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][5]
            case 6:
                lblPickerChoiceOUTLET.text = pickerDataSource[0][6]
            default:
                lblPickerChoiceOUTLET.text = "Picker View Choice"
            }
        }else if(component == 1){
            switch row {
            case 0:
                lblPickerChoiceOUTLET.backgroundColor = UIColor.red
            case 1:
                lblPickerChoiceOUTLET.backgroundColor = UIColor.blue
            case 2:
                lblPickerChoiceOUTLET.backgroundColor = UIColor.green
            default:
                lblPickerChoiceOUTLET.backgroundColor = UIColor.white
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let myTitle = NSMutableAttributedString(
                        string: pickerDataSource[component][row],
                        attributes: [ NSFontAttributeName:UIFont(name:"Chalkduster",
                              size:30)!,
                              NSForegroundColorAttributeName:UIColor.red
                            ]
                        )
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let myTitle = NSMutableAttributedString(
                        string: pickerDataSource[component][row],
                        attributes: [
                            NSFontAttributeName:UIFont(name:"Chalkduster",
                                                       size:30)!,
                            NSForegroundColorAttributeName:UIColor.red
                        ]
        )
        pickerLabel.attributedText = myTitle
        pickerLabel.textAlignment = .center
        return pickerLabel
    }
    
    
}

