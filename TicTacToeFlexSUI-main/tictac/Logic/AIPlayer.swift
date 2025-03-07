//
//  AIPlayer.swift
//  TicTacToeFlexSUI
//
//  Created by Александр Иванов on 06.03.2025.
//
import Foundation

class AIPlayer {
    func bestMove(board: [String], player: String) -> Int {
        var bestScore = Int.min
        var bestMove = -1
        
        for i in 0..<board.count {
            if board[i] == "" {
                var newBoard = board
                newBoard[i] = player
                let score = minimax(board: newBoard, isMaximizing: false, player: player)
                if score > bestScore {
                    bestScore = score
                    bestMove = i
                }
            }
        }
        
        return bestMove
    }
    
    private func minimax(board: [String], isMaximizing: Bool, player: String) -> Int {
        let opponent = player == "X" ? "O" : "X"
        
        if let winner = checkWinner(board: board) {
            return winner == player ? 1 : -1
        }
        
        if board.allSatisfy({ $0 != "" }) {
            return 0
        }
        
        if isMaximizing {
            var bestScore = Int.min
            for i in 0..<board.count {
                if board[i] == "" {
                    var newBoard = board
                    newBoard[i] = player
                    let score = minimax(board: newBoard, isMaximizing: false, player: player)
                    bestScore = max(score, bestScore)
                }
            }
            return bestScore
        } else {
            var bestScore = Int.max
            for i in 0..<board.count {
                if board[i] == "" {
                    var newBoard = board
                    newBoard[i] = opponent
                    let score = minimax(board: newBoard, isMaximizing: true, player: player)
                    bestScore = min(score, bestScore)
                }
            }
            return bestScore
        }
    }
    
    private func checkWinner(board: [String]) -> String? {
        let winPatterns = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
            [0, 4, 8], [2, 4, 6]             // Diagonals
        ]
        
        for pattern in winPatterns {
            let first = board[pattern[0]]
            if first != "", pattern.allSatisfy({ board[$0] == first }) {
                return first
            }
        }
        return nil
    }
}
