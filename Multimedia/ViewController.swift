//
//  ViewController.swift
//  Multimedia
//
//  Created by Sinchon on 2021/05/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //오디오 재생기
    var audioPlayer : AVAudioPlayer?
    
    @IBAction func changeVolume(_ sender: Any) {
        if let player = audioPlayer{
            let slider = sender as! UISlider
            player.volume = slider.value
        }
    }
    
    @IBAction func playAudio(_ sender: Any) {
        if let player = audioPlayer{
            player.play()
        }
    }
    
    @IBAction func stopAudio(_ sender: Any) {
        if let player = audioPlayer{
            player.stop()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //초기화 작업
        //노래 파일의 경로 생성
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "test", ofType: "mp3")!, relativeTo: nil)
            
        
        /*
        //인터넷에 있는 것 재생... 즉, 파일의 경로인 경우는 다운로드 받아서 파일로 만든 후, 작업을 수행
        let url = URL(string: "http://cyberadam.cafe24.com/song/if.mp3")
       
        //재생기 생성
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer?.prepareToPlay()
         */
    }


}

