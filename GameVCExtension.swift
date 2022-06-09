//
//  GameVCExtension.swift
//  Game_of_Words
//
//  Created by ПавелК on 30.01.2022.
//

import UIKit

extension GameViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return beforeWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as! WordCell
        cell.wordLabel.text = beforeWords[indexPath.row]
        cell.scoreLabel.text = "\(beforeWords[indexPath.row].count)"
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(named: "firstPlayer")
        } else {
            cell.backgroundColor = UIColor(named: "secondPlayer")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let word = beforeWords[indexPath.row]
        print("fvfvvsvs")
        showInfoAlert("\(word.uppercased()) : \(word.count) очков")
    }
    
}


