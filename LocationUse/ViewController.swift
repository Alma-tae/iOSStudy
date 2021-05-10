//
//  ViewController.swift
//  LocationUse
//
//  Created by Sinchon on 2021/05/10.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblAltitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblLatitude: UILabel!
    
    //버튼 클릭 메서드 - Toggle(반전 : 2가지 상태를 번갈아 가면서 수행하는 것)
    @IBAction func updateLocation(_ sender: Any) {
        //이벤트가 발생한 객체를 가져오기
        let btn = sender as! UIButton
        
        if btn.title(for: .normal) == "위치정보수집시작"{
            locationManager.startUpdatingLocation()
            btn.setTitle("위치정보수집중지", for: .normal)
            
            //영역 설정
            //중덤의 좌표 설정
            let center = CLLocationCoordinate2D(latitude: 37.5690886, longitude: 126.984652)
            //원의 거리 - 1km
            let maxDistance = 1000.0
            //영역을 생성
            region = CLCircularRegion(center: center, radius: maxDistance, identifier: "종로")
            //영역을 감시
            locationManager.startMonitoring(for: region)
            
        }else{
            locationManager.stopUpdatingLocation()
            locationManager.stopMonitoring(for: region)
            btn.setTitle("위치정보수집시작", for: .normal)
        }
    }
    
    //위치정보 사용을 위한 객체
    var locationManager : CLLocationManager = CLLocationManager()
    
    //첫번째 위치를 저장할 프로퍼티
    var startLocation : CLLocation!
    
    //영역에 대한 정보를 저장할 프로퍼티
    var region : CLCircularRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //정밀도 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //locationManager의 delegate 설정
        //locationManager만의 이벤트가 발생했을 때 호출될 메소드를 소유한 객체 지정
        //안드로이드나 Java GUI의 Listener 지정
        locationManager.delegate = self
        
        //위치 정보 사용을 위한 메소드 호출
        //앱이 실행 중인 동안만 위치 정보를 사용
        locationManager.requestWhenInUseAuthorization()
    }
}

extension ViewController:CLLocationManagerDelegate{
    //위치 정보를 가져오는데 성공했을 때 호출되는 메소드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //가장 마지막 위치 정보를 가져오기
        let latestLocation = locations[locations.count - 1]
        //위치 정보 가져오기
        let coordinate = latestLocation.coordinate
        
        //출력
        lblLatitude.text = String(format:"%.4f", coordinate.latitude)
        lblLongitude.text = String(format:"%.4f", coordinate.longitude)
        lblAltitude.text = String(format:"%.4f", latestLocation.altitude)
        
        //시작 위치 설정
        if startLocation == nil{
            startLocation = latestLocation
        }
        
        //이동한 거리 계산
        let distance = latestLocation.distance(from: startLocation)
        lblDistance.text = String(format:"%.2f", distance)
    }
    
    //위치 정보를 가져오는데 실패했을 때 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let alert = UIAlertController(title: "위치정보", message: "위치정보 가져오기 실패", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
    
    //영역에 들어온 경우 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        let alert = UIAlertController(title: "종로", message: "종로에 들어옴", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
    //영역에 나가는 경우 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        let alert = UIAlertController(title: "종로", message: "종로에서 나감", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true)
    }
}
