//
//  ViewController.swift
//  Tabuleiro4
//
//  Created by Wagner J Silva on 26/09/2018.
//  Copyright © 2018 Wagner J Silva. All rights reserved.
//

import UIKit
import AVFoundation

var frases = ["Faça o acorde G", "Faça o acorde C", "Faça o acorde D", "Faça o acorde A", "Faça o acorde F", "Faça o acorde Am", "Faça o acorde Dm", "Faça o acorde Em", "Faça o acorde Am7", "Perde a vez", "Volte duas casas", "Volte ao inicio", "Avance duas casas", "Toque para cima e para baixo o acorde C", "Toque a Sequencia Am F C G", "Toque o acorde C com o Ukulele nas costas", "Qual a afinação do Ukulele", "Faça o tubarão 🦈", "Faça a formiguinha 🐜", "Explique como fazer o acorde G", "Indique um amigo para fazer o acorde Dm", "C representa a nota?", "D representa a nota?", "E representa a nota?", "F representa a nota?", "G representa a nota?", "A representa a nota?","B representa a nota?", "Faça dois acordes tristes 😭", "Faça dois acordes felizes 😁", "Faça o acorde mais difícil que você sabe"]

// FRASES PARA O JOGO DE GUITARRA //

//var frases = ["Faça o acorde G", "Faça o acorde C", "Faça o acorde D", "Faça o acorde A", "Faça o acorde F", "Faça o acorde Am", "Faça o acorde Dm", "Faça o acorde Em", "Faça o acorde Am7", "Perde a vez", "Volte duas casas", "Volte ao inicio", "Avance duas casas", "Toque para cima e para baixo o acorde C", "Toque a Sequencia Am F C G", "Faça a pentatonica shape 1", "Faça a pentatonica shape 2", "Faça a pentatonica shape 3", "Faça a pentatonica shape 4", "Faça a pentatonica shape 5", "Faça um lick que tenha bend", "Faça um lick que tenha hammer on e pull off", "Faça um lick que tenha slide"]

var posicaoRed = 0
var posicaoBlue = 0
var posicaoYellow = 0
var jogadores = ["red", "blue", "yellow"]
var tokens = [#imageLiteral(resourceName: "apps.57763.9007199266397756.057ffdcb-7d8e-4bf1-90ba-5cd1d2328eab.7f769ab6-1a7e-4d21-84c7-181bbbf17880.png"),#imageLiteral(resourceName: "bluetoken.png"),#imageLiteral(resourceName: "yellow.png")]
var facesDado = [#imageLiteral(resourceName: "dice-1-md.png"),#imageLiteral(resourceName: "dice-2-md.png"),#imageLiteral(resourceName: "dice-3-md.png"),#imageLiteral(resourceName: "dice-4-md.png"),#imageLiteral(resourceName: "dice-5-md.png"),#imageLiteral(resourceName: "dice-6-md.png")]
let contador = frases.count - 1
var jogadorRodada = 0
var numJogadores = 3


class ViewController: UIViewController {
   
    var audioPlayer = AVAudioPlayer()
    var steps = AVAudioPlayer()

   
    let number = Int.random(in: 1 ... 6)
  
    @IBOutlet weak var dado: UIImageView!
    
    @IBOutlet var caminhoRed: [UIImageView]!
    
    @IBOutlet var caminhoBlue: [UIImageView]!
    
    @IBOutlet var caminhoYellow: [UIImageView]!
    
    @IBAction func NumeroJogadores(_ sender: UIButton) {
        if sender.tag == 1 {
            numJogadores = 1
            posicaoRed = 0
            
            for i in 0...31 {
                if i == posicaoRed {
                    caminhoRed[i].image = tokens[0]
                }
                else{
                    caminhoRed[i].image = nil
            }
            }
            posicaoBlue = 0
            for i in 0...31 {
                    caminhoBlue[i].image = nil
            }
            posicaoYellow = 0
            for i in 0...31 {
                    caminhoYellow[i].image = nil
            }
        }
        else if sender.tag == 2{
            numJogadores = 2
            posicaoRed = 0
            for i in 0...31 {
                if i == posicaoRed {
                    caminhoRed[i].image = tokens[0]
                }
                else{
                    caminhoRed[i].image = nil
                }
            }
            posicaoBlue = 0
            for i in 0...31 {
                if i == posicaoBlue {
                    caminhoBlue[i].image = tokens[1]
                }
                else{
                    caminhoBlue[i].image = nil
                }
            }
            posicaoYellow = 0
            for i in 0...31 {
                    caminhoYellow[i].image = nil
                
        }
        }
        else {
            numJogadores = 3
            posicaoRed = 0
            for i in 0...31 {
                if i == posicaoRed {
                    caminhoRed[i].image = tokens[0]
                }
                else{
                    caminhoRed[i].image = nil
                }
            }
            posicaoBlue = 0
            for i in 0...31 {
                if i == posicaoBlue {
                    caminhoBlue[i].image = tokens[1]
                }
                else{
                    caminhoBlue[i].image = nil
                }
            }
            posicaoYellow = 0
            for i in 0...31 {
                if i == posicaoYellow {
                    caminhoYellow[i].image = tokens[2]
                }
                else{
                    caminhoYellow[i].image = nil
                }
        }
    }
    }
    @IBAction func reset(_ sender: UIButton) {
        audioPlayer.stop()
        posicaoRed = 0
        for i in 0...31 {
            if i == posicaoRed {
                caminhoRed[i].image = tokens[0]
            }
            else{
                caminhoRed[i].image = nil
            }
        }
        posicaoBlue = 0
        for i in 0...31 {
            if i == posicaoBlue {
                caminhoBlue[i].image = tokens[1]
            }
            else{
                caminhoBlue[i].image = nil
            }
        }
        posicaoYellow = 0
        for i in 0...31 {
            if i == posicaoYellow {
                caminhoYellow[i].image = tokens[2]
            }
            else{
                caminhoYellow[i].image = nil
            }
        }
        jogadorRodada = 0
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        let jogador = jogadores[jogadorRodada]
        let message = frases[Int.random(in: 0 ... contador)]
        let numDado = Int.random(in: 1 ... 6)
        dado.image = facesDado[numDado - 1]

        if numJogadores == 1 {
        
        if jogador == "red" {
            posicaoRed = posicaoRed + numDado
            if message == "Volte ao inicio" {
                posicaoRed = 0
            }
            else if message == "Volte duas casas"{
                posicaoRed = posicaoRed - 2
            }else if message == "Avance duas casas"{
                posicaoRed = posicaoRed + 2
            }else if message == "Perde a vez"{
                posicaoRed = posicaoRed - numDado
            }
            
            for i in 0...31 {
                if i == posicaoRed {
                    caminhoRed[i].image = tokens[0]
                }
                else{
                    caminhoRed[i].image = nil
                }
            }
            
        }
        }
        else if numJogadores == 2 {
        
        if jogador == "red" {
                posicaoRed = posicaoRed + numDado
                if message == "Volte ao inicio" {
                    posicaoRed = 0
                }
                else if message == "Volte duas casas"{
                    posicaoRed = posicaoRed - 2
                }else if message == "Avance duas casas"{
                    posicaoRed = posicaoRed + 2
                }else if message == "Perde a vez"{
                    posicaoRed = posicaoRed - numDado
                }
                
                for i in 0...31 {
                    if i == posicaoRed {
                        caminhoRed[i].image = tokens[0]
                    }
                    else{
                        caminhoRed[i].image = nil
                    }
                }
                
            }
            
        else if jogador == "blue" {
            posicaoBlue = posicaoBlue + numDado
            if message == "Volte ao inicio" {
                posicaoBlue = 0
            }
            else if message == "Volte duas casas"{
                posicaoBlue = posicaoBlue - 2
            }else if message == "Avance duas casas"{
                posicaoBlue = posicaoBlue + 2
            }else if message == "Perde a vez"{
                posicaoBlue = posicaoBlue - numDado
            }
            for i in 0...31 {
                if i == posicaoBlue {
                    caminhoBlue[i].image = tokens[1]
                }
                else{
                    caminhoBlue[i].image = nil
                }
        
            }
        
        }
        }
        else if numJogadores == 3 {
            
            if jogador == "red" {
                posicaoRed = posicaoRed + numDado
                if message == "Volte ao inicio" {
                    posicaoRed = 0
                }
                else if message == "Volte duas casas"{
                    posicaoRed = posicaoRed - 2
                }else if message == "Avance duas casas"{
                    posicaoRed = posicaoRed + 2
                }else if message == "Perde a vez"{
                    posicaoRed = posicaoRed - numDado
                }
                
                for i in 0...31 {
                    if i == posicaoRed {
                        caminhoRed[i].image = tokens[0]
                    }
                    else{
                        caminhoRed[i].image = nil
                    }
                }
                
            }
                
            else if jogador == "blue" {
                posicaoBlue = posicaoBlue + numDado
                if message == "Volte ao inicio" {
                    posicaoBlue = 0
                }
                else if message == "Volte duas casas"{
                    posicaoBlue = posicaoBlue - 2
                }else if message == "Avance duas casas"{
                    posicaoBlue = posicaoBlue + 2
                }else if message == "Perde a vez"{
                    posicaoBlue = posicaoBlue - numDado
                }
                for i in 0...31 {
                    if i == posicaoBlue {
                        caminhoBlue[i].image = tokens[1]
                    }
                    else{
                        caminhoBlue[i].image = nil
                    }
                    
                }
                
            }
            else if jogador == "yellow" {
                posicaoYellow = posicaoYellow + numDado
                if message == "Volte ao inicio" {
                posicaoYellow = 0
                }
                else if message == "Volte duas casas"{
                posicaoYellow = posicaoYellow - 2
                }
                else if message == "Avance duas casas"{
                posicaoYellow = posicaoYellow + 2
                }
                else if message == "Perde a vez"{
                posicaoYellow = posicaoYellow - numDado
                }
                    for i in 0...31 {
                        if i == posicaoYellow {
                            caminhoYellow[i].image = tokens[2]
                        }
                        else{
                            caminhoYellow[i].image = nil
                }
            }
        }
        }
        
        if posicaoRed >= 31 || posicaoBlue >= 31 || posicaoYellow >= 31{
            audioPlayer.play()
            let alert = UIAlertView()
            alert.title = "🎉 "
            alert.message = "Parabéns! Você venceu!"
            alert.addButton(withTitle: "💃 🕺")
            alert.show()
            
        }
        else {
            let alert = UIAlertView()
            alert.title = "TAREFA"
            alert.message = message
            alert.addButton(withTitle: "👍")
            alert.show()
            
        }
        if numJogadores == 3 {
            jogadorRodada = jogadorRodada + 1
        
            if jogadorRodada >= jogadores.count {
            jogadorRodada = 0
                }
                
            }
        else if numJogadores == 2 {
            jogadorRodada = jogadorRodada + 1
            if jogadorRodada >= 2 {
                jogadorRodada = 0
            }
        else if numJogadores == 1 {
            jogadorRodada = 0
                }
        
        }
        steps.play()
    }
        
    
    override func viewDidLoad() {
        caminhoRed[0].image = tokens[0]
        caminhoBlue[0].image = tokens[1]
        caminhoYellow[0].image = tokens[2]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "sound", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        do {
            steps = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "steps", ofType: "wav")!))
            steps.prepareToPlay()
        }
        catch{
            print(error)
        }
    }
}
