//
//  ViewController1.swift
//  ExWeather
//
//  Created by MAC on 8/7/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Foundation

class ViewController1: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private var districts = [District]()
    var updistricts = [District]() // update table
    var valu = [String: Any]()
    // this is on branch son
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var search: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupdist()
        setupsearch()
        
    }
    
    private func setupdist() {
        districts.append(District(name: "Hồ Chí Minh", value: ["query":"Ho%20Chi%20Minh"] ))
        districts.append(District(name: "London",  value: ["query":"London"] ))
        districts.append(District(name: "Canberra", value: ["query":"Canberra"] ))
        districts.append(District(name: "Tokyo",   value: ["query":"Tokyo"] ))
        districts.append(District(name: "Hải Phòng", value: ["query":"Hai%20Phong"] ))
        districts.append(District(name: "Cần Thơ",   value: ["query":"Can%20Tho"] ))
        districts.append(District(name: "Hà Nội",  value: ["query":"Ha%20Noi"] ))
        districts.append(District(name: "Thượng Hải", value: ["query":"Shanghai"] ))
        districts.append(District(name: "Bắc Kinh", value: ["query":"Shanghai"] ))
        districts.append(District(name: "Hài Phòng", value: ["query":"Shanghai"] ))
        districts.append(District(name: "Đà Nẵng", value: ["query":"Shanghai"] ))
        districts.append(District(name: "Binh Dinh", value: ["query":"Shanghai"] ))
        
        
        updistricts = districts
    }
    
    private func setupsearch() {
        search.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return updistricts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        let dist:District = updistricts[indexPath.row]
        cell.lblnamee?.text = dist.name
        
        //        cell.lblnamee?.text = districts[indexPath.row].name
        //        valu = dist.value!
        //        print(valu)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mh2 = sb.instantiateViewController(withIdentifier: "man2") as! ViewController
        
        let dist:District = updistricts[indexPath.row]
        valu = dist.value!
//        valu = districts[indexPath.row].value!
        
        mh2.params = valu
        self.navigationController?.pushViewController(mh2, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            updistricts = districts
            table.reloadData()
            return
        }
        updistricts = districts.filter({ call -> Bool in
             call.name.contains(searchText)
        })
        table.reloadData()
    }
}


