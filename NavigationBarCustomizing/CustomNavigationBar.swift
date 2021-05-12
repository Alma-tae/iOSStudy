//
//  CustomNavigationBar.swift
//  NavigationBarCustomizing
//
//  Created by Sinchon on 2021/05/12.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

   //높이를 위한 프로퍼티
    var customHeight : CGFloat = 200
    
    //뷰의 크기를 결정하는 메서드
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: customHeight)
    }
    
    //뷰를 출력해야할 때마다 호출되는 메서드
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //상태 표시줄의 높이
        let y = UIApplication.shared.statusBarFrame.height
        frame = CGRect(x: frame.origin.x, y: y, width: frame.size.width, height: customHeight)
        
        for subview in self.subviews{
            var stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarBackground"){
                subview.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: customHeight)
                self.backgroundColor = self.backgroundColor
            }
            
            stringFromClass = NSStringFromClass(subview.classForCoder)
            if stringFromClass.contains("BarContent"){
                subview.frame = CGRect(x: subview.frame.origin.x, y: 20, width: subview.frame.width, height: customHeight)
                subview.backgroundColor = self.backgroundColor
            }
        }
    }

}
