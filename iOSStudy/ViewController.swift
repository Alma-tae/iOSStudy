//
//  ViewController.swift
//  iOSStudy
//
//  Created by Sinchon on 2021/04/20.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTabCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //회전이 발생하루 때 발생하는 노티피케이션 처리
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main){(Notification)->Void in NSLog("회전이 발생할 때 호출되는 노티피케이션")
        }
    }
        //뷰 컨트롤러의 뷰에 터치가 발생했을 때 호출되는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //터치를 1개 가져오기
        let touch = touches.first
        //두드린 횟수 찾아오기
        let tapCount = touch?.tapCount
        //레이블에 출력
        lblTabCount.text = "\(tapCount!) 번 두드림"
    }

    //뷰에서 터치한 상태로 움직일 때 호출되는 메서드
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        lblTabCount.text = "터치로 이동"
        
        //터치한 뷰가 imgView라면
        let touch = touches.first
        if touch!.view == imgView{
            //imgView의 중앙을 터치한 좌표로 설정
            imgView.center = touch!.location(in: self.view)
        }
    }
    //회전 방향을 지원하기 위한 프로퍼티
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return [.all]
    }
    
    //회전이 발생하면 호출되는 메서드
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape{
            NSLog("가로로 회전")
        }else{
            NSLog("세로로 회전")
        }
    }
}

