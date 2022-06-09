//
//  GameViewController.swift
//  Game_of_Words
//
//  Created by ПавелК on 27.01.2022.
//
import UIKit

class GameViewController: UIViewController {
    var firstName = ""
    var secondName = ""
    var firstScore = 0
    var secondScore = 0
    var bigWord = ""
    var beforeWords = [String] ()
    var isFirst = true
   
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var bigWordLabel: UILabel!
    @IBOutlet weak var firstUserStack: UIStackView!
    @IBOutlet weak var secondUserStack: UIStackView!
    @IBOutlet weak var firstScoreLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondScoreLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var smallWordTextField: UITextField!
    @IBOutlet weak var readyButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dismissKeyboard()
    }
    
    @IBAction func checkTap(_ sender: UIButton) {
        guard let word = smallWordTextField.text else { return }
        let resultScore = checkWord(word: word)
        if isFirst {
            firstScore += resultScore
        } else {
            secondScore += resultScore
        }
        if resultScore > 0 { isFirst.toggle() }
       updateViews()
    }
    @IBAction func quitTap(_ sender: UIButton) {
         alertFor(word: "quit")
        let startVc = storyboard?.instantiateViewController(withIdentifier: "StartVc") as! StartViewController
        startVc.wordText = ""
        startVc.firstPlayerName = ""
        startVc.secondPlayerName = ""
        
        }
    func borderForStack ()-> Void {
        var currentStack = UIStackView()
        var otherStack = UIStackView()
        if isFirst {
            currentStack = self.firstUserStack
            otherStack = self.secondUserStack
        } else {
            currentStack = self.secondUserStack
            otherStack = self.firstUserStack
        }
        currentStack.layer.shadowRadius = 10
        currentStack.layer.shadowColor = UIColor.black.cgColor
        currentStack.layer.shadowOpacity = 0.8
        otherStack.layer.shadowOpacity = 0
    }
    func checkWord (word : String) -> Int {
        guard verify(word: word) else {return 0}
        let smallChars = wordToChars(word: word)
        var bigChars = wordToChars(word: bigWord)
        var resultString = ""
        smallWordTextField.text = ""
        for char in smallChars {
            if bigChars.contains(char) {
                resultString.append(char)
                var index = 0
                while bigChars[index] != char {
                    index += 1
                }
                bigChars.remove(at: index)
            } else {
                showInfoAlert("Такое слово не может быть составлено")
                return 0
            }
        }
        beforeWords.append(word)
        return resultString.count
    }
    
    func verify (word : String) -> Bool {
        let word = word.lowercased()
        guard word.count > 1 else  {
            showInfoAlert("Слово должно содержать более 1 буквы")
            return false
        }
        guard word != self.bigWord else {
            showInfoAlert("Это исходное слово")
            return false
        }
        guard !beforeWords.contains(word) else {
            showInfoAlert("Это слово уже было")
            return false
        }
        return true
    }
    
    func wordToChars (word : String) -> [Character] {
        let word = word.lowercased()
        var charArray = [Character]()
        for char in word {
            charArray.append(char)
        }
        return charArray
    }
    
    func updateViews ()-> Void {
        firstScoreLabel.text = "\(firstScore)"
        secondScoreLabel.text = "\(secondScore)"
        tableView.reloadData()
        borderForStack()
    }
    
    func setupViews () {
        let arrayViews = [quitButton,firstUserStack,secondUserStack,readyButton]
        for view in arrayViews {
            view?.layer.cornerRadius = 12
        }
        bigWordLabel.layer.cornerRadius = 12
        bigWordLabel.layer.masksToBounds = true
        firstScoreLabel.text = "\(firstScore)"
        secondScoreLabel.text = "\(secondScore)"
        firstNameLabel.text = firstName
        secondNameLabel.text = secondName
        bigWordLabel.text = bigWord
        tableView.delegate = self
        tableView.dataSource = self
        borderForStack()
    }
}



