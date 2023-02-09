//
//  ViewController.swift
//  RefactorMVVM
//
//  Created by Guillermo Saavedra Dorantes on 22/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Outlets for storyboard connections
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    @IBOutlet weak var addPlayer1PointButton: UIButton!
    @IBOutlet weak var addPlayer2PointButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    @IBOutlet weak var matchHistoryTable: UITableView!
    
    //MARK: - Variables inits
    var playerScores = [Scores.love, Scores.love]
    var games = [Game]()
    
    //MARK: - ViewController life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        matchHistoryTable.register(UINib(nibName: GameTableViewCell.cellIdentifier, bundle: .main), forCellReuseIdentifier: GameTableViewCell.cellIdentifier)
        matchHistoryTable.delegate = self
        matchHistoryTable.dataSource = self
        matchHistoryTable.allowsSelection = false
    }
    
    //MARK: - Button action outlets
    @IBAction func player1PointTapped(_ sender: UIButton) {
        playerScore(0)
    }
    
    @IBAction func player2PointTapped(_ sender: UIButton) {
        playerScore(1)
    }
    
    func playerScore(_ playerNumber: Int) {
        playerScores[playerNumber] = playerScores[playerNumber].getNext()
        
        if playerScores[playerNumber].getNext() == .win {
            winAlert(playerNumber)
            
        }
        
        updateScores()
    }
    
    func winAlert(_ playerNumber: Int) {
        let winMessage = "Ganó el jugador \(playerNumber + 1)"
        let alert = UIAlertController(title: "Partido terminado", message:  winMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Nuevo partido", comment: "Default action"), style: .default, handler: { _ in
            self.saveGame()
            self.resetScores()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        resetScores()
    }
    
    private func saveGame() {
        games.append(Game(player1Score: playerScores[0], player2Score: playerScores[1], gameNumber: games.count + 1))
    }
    
    private func resetScores() {
        playerScores = [Scores.love, Scores.love]
        updateScores()
    }
    
    private func updateScores() {
        player1ScoreLabel.text = playerScores[0].getText()
        player2ScoreLabel.text = playerScores[1].getText()
        matchHistoryTable.reloadData()
    }
    
    //MARK: - TableView delegates and data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard games.count > 0, let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.cellIdentifier, for: indexPath) as? GameTableViewCell else { return UITableViewCell() }
        
        let cellInfo = games.reversed()[indexPath.row]
        cell.player1ScoreLabel.text = "Jugador 1: \(cellInfo.player1Score.getText())"
        cell.player2ScoreLabel.text = "Jugador 2: \(cellInfo.player2Score.getText())"
        cell.gameLabel.text = "Partido: \(cellInfo.gameNumber)"
        return cell
    }
}

enum Scores {
    case love
    case first
    case second
    case third
    case deuce
    case advantage
    case win
    
    func getNext() -> Scores {
        switch self {
        case .love:
            return .first
        case .first:
            return .second
        case .second:
            return .third
        case .third:
            return .deuce
        case .deuce:
            return .advantage
        case .advantage:
            return .win
        case .win:
            return .love
        }
    }
    
    func getText() -> String {
        switch self {
        case .love:
            return "Love"
        case .first:
            return "15"
        case .second:
            return "30"
        case .third:
            return "40"
        case .deuce:
            return "Deuce"
        case .advantage:
            return "Ventaja"
        case .win:
            return "Ganó"
        }
    }
}

struct Game {
    let player1Score: Scores
    let player2Score: Scores
    let gameNumber: Int
}

