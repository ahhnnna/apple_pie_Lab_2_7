//
//  ViewController.swift
//  apple_pie_Lab_2_7
//
//  Created by Anna CS on 2/12/19.
//  Copyright © 2019 Anna Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
   
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords = ["bart","homer", "msmrt", "doh", "unpossible", "saxamaphone", "jebus", "yoink", "cromulent", "embiggen", "craptacular", "kwyjibo", "tomacco", "sacralicious","nucular", "glayvin","cowabunga","smarch","floorpie","woozlewuzzle"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
    }
    }
    var totalLoses = 0{
        didSet{
            newRound()
        }
    }
    
    var currentGame: Game! //exc mark means its ok if initial value doesn't have value
    
    @IBAction func buttonPressed(_ sender: UIButton) { sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        
        updateGameState()
        
    }
    
    
    override func viewDidLoad() {
        //let square = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        //square.backgroundColor = UIColor.red
        //self.view.addSubview(square)
    
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        newRound()
        
        
    }
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [] )
        enableLetterButtons(true)
            updateUI()
        }else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable:Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    func updateUI(){
        var letters = [String] ()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        
        //correctWordLabel.text = currentGame.formattedWord
        //the book says game but should be currentGame.formattedWord
        
        scoreLabel.text = "Wins \(totalWins), Losses: \(totalLoses)"
            treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLoses += 1
        }else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }else {
            updateUI()
        }
    }
    
}
