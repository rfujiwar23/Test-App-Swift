//
//  ViewController.swift
//  Player
//
//  Created by Ryo Fujiwara on 2022/03/12.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton() {
        if let player = player,player.isPlaying {
            // stop playback
            button.setTitle("Play", for: .normal)
            player.stop()
        }
        else {
            // set up player, and play
            button.setTitle("Stop", for: .normal)
            let urlString = Bundle.main.path(forResource: "06 Salut D'Amour", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                
                player.play()
            }
            catch {
                print("Something went wrong")
            }
        }
    }

}

