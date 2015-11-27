//
//  AudioController.swift
//  PIG
//
//  Created by Henrique do Prado Linhares on 27/11/15.
//  Copyright © 2015 Henrique do Prado Linhares. All rights reserved.
//

import Foundation
import AVFoundation

class AudioControler{
    static let sharedInstance = AudioControler()
    private var audioPlayer: AVAudioPlayer!
    
    func playBackgroundSong() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("song1", ofType: "wav")!))
            self.audioPlayer.play()
            
        } catch {
            print("Error")
        }
    }
    
    
    func stopBackgroundSong() {
        self.audioPlayer.stop()
    }
    
    func playSong1() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("song1", ofType: "wav")!))
            self.audioPlayer.play()
            
        } catch {
            print("Error")
        }
    }
    
    func playSong2() {
        do {
            self.audioPlayer =  try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("song2", ofType: "wav")!))
            self.audioPlayer.play()
            
        } catch {
            print("Error")
        }
    }
    
    


}