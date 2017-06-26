//
//  ViewController.swift
//  mediaPlayground
//
//  Created by vara shen on 2017/6/22.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit
import CoreImage
import AVFoundation
import MediaPlayer
import AVKit
class ViewController: UIViewController {
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    @IBOutlet weak var recordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord)
        let soundFileURL: URL = URL(fileURLWithPath: NSTemporaryDirectory()+"sound.caf")
        let soundSetting = [
            //录音机每秒采集的音频样本数
            AVSampleRateKey: 44100.0,
            //录音的格式，必须将其值设置为一个Nsnumber, 否则将失败
            AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC),
            //录音的声道数。例如，立体声为双声道
            AVNumberOfChannelsKey: 2,
            //编码器的质量设置
            AVEncoderAudioQualityKey:AVAudioQuality.high.rawValue
        ] as [String : Any]
        
        audioRecorder = try? AVAudioRecorder(url: soundFileURL,settings: soundSetting)
        let noSoundFileURL: URL = URL(fileURLWithPath: Bundle.main.path(forResource: "Motohiko", ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: noSoundFileURL)
    }
    @IBAction func loadMovie(_ sender: AnyObject?) {
        let movieFilename: String = Bundle.main.path(forResource: "Transformers", ofType: "mp4")!
        let moviePlayer: AVPlayer = AVPlayer(url: URL(fileURLWithPath: movieFilename))
        let playerViewController: AVPlayerViewController = childViewControllers.last as! AVPlayerViewController
        playerViewController.player = moviePlayer

        //添加观察者
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playMovieFinished(_:)),name:NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.currentItem)
    }
    
    func playMovieFinished(_ notification: Notification) {
        let playerViewController: AVPlayerViewController = childViewControllers.last as! AVPlayerViewController
        NotificationCenter.default.removeObserver(self,name: NSNotification.Name.AVPlayerItemDidPlayToEndTime , object: playerViewController.player!.currentItem)
        playerViewController.player = nil
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        print("state:\(UIControlState.normal)")
        if recordButton.titleLabel!.text == "Record Audio" {
            audioRecorder.record()
            recordButton.setTitle("Stop Recording", for: UIControlState.normal)
        }else{
            audioRecorder.stop()
            recordButton.setTitle("Record Audio", for: UIControlState.normal)
        }
        let soundFileURL: URL = URL(fileURLWithPath: NSTemporaryDirectory() + "sound.caf")
        audioPlayer = try? AVAudioPlayer(contentsOf: soundFileURL)
    }
    @IBAction func playAudio(_ sender: Any) {
        audioPlayer.play()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

