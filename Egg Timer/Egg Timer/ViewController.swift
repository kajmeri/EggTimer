//
//  ViewController.swift
//  Egg Timer
//
//  Created by Krishna Ajmeri on 1/19/20.
//  Copyright © 2020 Krishna Ajmeri. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
	
	let eggTimes = [
		"Soft" : 300.0,
		"Medium" : 420.0,
		"Hard" : 720.0
	]
	
	var timer = Timer()
	var player : AVAudioPlayer!
	
	@IBAction func eggPressed(_ sender: UIButton) {
		
		timer.invalidate()
		
		let hardness = sender.currentTitle!
		var timeLeft = eggTimes[hardness]!
		titleLabel.text = hardness
		
		timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
			
			timeLeft -= 1
			self.progressBar.progress = Float(timeLeft / self.eggTimes[hardness]!)
			
			if timeLeft == 0 {
				timer.invalidate()
				self.titleLabel.text = "Done!"
				
				let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
				self.player = try! AVAudioPlayer(contentsOf: url!)
				self.player.play()
			}
		}
	}
}

