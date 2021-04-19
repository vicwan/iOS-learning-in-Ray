//
//  Game.swift
//  Bullseye
//
//  Created by Vic Wan on 2021/4/14.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 40, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 60, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
    addToLeaderboard(points: points)
  }
  
  mutating func addToLeaderboard(points: Int) {
    let leaderboardEntry: LeaderboardEntry = LeaderboardEntry(score: points, date: Date())
    leaderboardEntries.append(leaderboardEntry)
    leaderboardEntries.sort{ $0.score > $1.score }
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
}
