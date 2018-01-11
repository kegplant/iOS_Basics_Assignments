//
//  ViewController.swift
//  TTT
//
//  Created by Song on 1/10/18.
//  Copyright © 2018 Song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var TTTCells: [UIButton]!
//    @IBOutlet weak var TTTCell: UIButton!
    @IBOutlet weak var winnerLabel: UILabel!
    var player=1
    var board:[[Int]]=[[]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetBoard()
    }
    @IBAction func TTTButtonPressed(_ sender: UIButton) {
        if sender.tag == -1 {
            return
        }
        board[sender.tag/3][sender.tag%3]=player
        if player==1 {
            sender.backgroundColor = .red
            checkWinner()
            player=2
        }else{
            sender.backgroundColor = .blue
            checkWinner()
            player=1
        }
        sender.tag = -1
    }
    @IBAction func resetPressed(_ sender: UIButton) {
        resetBoard()
    }
    func resetBoard(){
        board=[[Int]](repeating:[Int](repeating:0, count: 3),count:3)
        player=1
        winnerLabel.text=""
        for i in 0..<TTTCells.count {
            let cell=TTTCells[i]
            cell.setTitle(String(i),for:.normal)
            cell.tag=i
            cell.backgroundColor = .gray
        }
    }
    func checkWinner(){
        for i in 0..<board.count{
            if board[i][0]==board[i][1]&&board[i][1]==board[i][2]&&board[i][0] != 0{
                endGameOnWin()
            }else if board[0][i]==board[1][i]&&board[1][i]==board[2][i]&&board[0][i] != 0{
                endGameOnWin()
            }else if board[0][0]==board[1][1]&&board[1][1]==board[2][2]&&board[0][0] != 0{
                endGameOnWin()
            }
            
        }
        
    }
    func endGameOnWin(){
        for cell in TTTCells {
            cell.tag = -1
        }
        winnerLabel.text = "Winner is: Player \(player)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

