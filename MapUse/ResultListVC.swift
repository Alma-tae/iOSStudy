//
//  ResultListVC.swift
//  MapUse
//
//  Created by Sinchon on 2021/05/10.
//

import UIKit
import MapKit

class ResultListVC: UITableViewController {

    //이전 뷰 컨트롤러로부터 데이터를 넘겨받을 프로퍼티
    var mapItem:[MKMapItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = ""
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //mapItem 이 nil이면 0
        return mapItem?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell")

        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ResultCell")
        }
        
        //데이터 찾아와서 출력하기
        if let item = mapItem?[indexPath.row]{
            cell?.textLabel?.text = item.name
            cell?.detailTextLabel?.text = item.phoneNumber
        }

        return cell!
    }
    

 

}
