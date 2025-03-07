//
//  GameSettingsView.swift
//  tictac
//  B.RF Group
//
import SwiftUI

struct GameSettingsS: View {
    @EnvironmentObject var gameManager: GameManager
    @State var boardSize = 0
    @State var showGame: Bool = false
    @State var isAgainstAI: Bool = false
    @State var isPlayerFirst: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                
                Text("Размер поля: \(gameManager.boardSize)x\(gameManager.boardSize)")
                Slider(value: Binding(
                    get: { Double(gameManager.boardSize) },
                    set: { newValue in gameManager.boardSize = Int(newValue)
                    }
                ), in: 3...10, step: 1)
                .padding()
                
                Toggle("Играть против ИИ", isOn: $isAgainstAI)
                    .padding()
                
                //if isAgainstAI {
                    //Toggle("Игрок ходит первым", isOn: $isPlayerFirst)
                        //.padding()
               // }
                
                Button() {
                    gameManager.isAgainstAI = isAgainstAI
                    gameManager.isPlayerFirst = isPlayerFirst
                    gameManager.showGame = true
                } label: {
                    Text("Start")
                        .foregroundColor(.white)
                        .font(.title)
                        .padding()
                        .background(Color(.blue))
                        .cornerRadius(15)
                }
                Spacer()
            }.navigationTitle("Tic Tac Toe")
        }
    }
}
#Preview {
    GameSettingsS()
}
