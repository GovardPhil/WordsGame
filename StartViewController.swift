//
//  ViewController.swift
//  Game_of_Words
//
//  Created by ПавелК on 26.01.2022.
//

import UIKit

class StartViewController: UIViewController {
    var wordText = ""
    var firstPlayerName = ""
    var secondPlayerName = ""
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var firstPlayerTextField: UITextField!
    @IBOutlet weak var secondPlayerTextField: UITextField!
    @IBOutlet weak var startGameButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dismissKeyboard()
        chooseUIElement()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        wordTextField.text = wordText
        firstPlayerTextField.text = firstPlayerName
        secondPlayerTextField.text = secondPlayerName
    }
    
    
    func setupViews () -> Void {
       let array = [wordTextField,firstPlayerTextField,secondPlayerTextField,startGameButton]
        for view in array {
            view?.layer.cornerRadius = 12
        }
        startGameButton.titleLabel?.font = UIFont(name: "Helvetica", size: 25)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "ToGameVC" :
            let destVC = segue.destination as! GameViewController
            if let bigWord = self.wordTextField.text, bigWord.count >= 10 {
                destVC.bigWord = bigWord
            } else {alertFor(word: "word")}
            
            if let firstPlayerName = self.firstPlayerTextField.text, firstPlayerName.count >= 2 {
                destVC.firstName = firstPlayerName
            } else {alertFor(word: "name")}
            
            if let secondPlayerName = self.secondPlayerTextField.text, secondPlayerName.count >= 2 {
                destVC.secondName = secondPlayerName
            } else {alertFor(word: "name")}
        default :
            break
        }
    }
    @IBAction func startGameTap(_ sender: Any) {
      performSegue(withIdentifier: "ToGameVC", sender: nil)
    }
    func chooseUIElement() -> Void {
     let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        wordTextField.inputView = picker
    }
}








