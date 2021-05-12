//
//  SceneDelegate.swift
//  SwipeTab
//
//  Created by Sinchon on 2021/05/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    //화면이 만들어질 때 호출되는 메소드
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        //뷰 컨트롤러 추가
        let vc1 = FirstVC()
        vc1.view.backgroundColor = UIColor(red: 0.2, green: 0.4, blue: 0.5, alpha: 1.0)
        vc1.title = "First"
        
        let vc2 = FirstVC()
        vc2.view.backgroundColor = UIColor(red: 0.5, green: 0.7, blue: 0.8, alpha: 1.0)
        vc2.title = "Second"
        
        let vc3 = FirstVC()
        vc3.view.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 0.3, alpha: 1.0)
        vc3.title = "Third"
        
        let swipeViewController = ViewController(pages: [vc1, vc2, vc3])
        
        swipeViewController.startIndex = 0
        swipeViewController.selectionBarWidth = 80
        swipeViewController.selectionBarHeight = 3
        swipeViewController.selectionBarColor = UIColor(red: 0.23, green: 0.55, blue: 0.92, alpha: 1.0)
        swipeViewController.selectedButtonColor = UIColor(red: 0.23, green: 0.55, blue: 0.92, alpha: 1.0)
        swipeViewController.equalSpaces = true
        
        window?.rootViewController = swipeViewController
        window?.makeKeyAndVisible()
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

