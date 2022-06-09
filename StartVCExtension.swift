//
//  StartVCExtension.swift
//  Game_of_Words
//
//  Created by ПавелК on 31.01.2022.
//

import UIKit

extension StartViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WordsArray.words.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return WordsArray.words[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        wordTextField.text = WordsArray.words[row]
    }
}
