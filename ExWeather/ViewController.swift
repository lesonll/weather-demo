//
//  ViewController.swift
//  ExWeather
//
//  Created by MAC on 8/4/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var lblcity: UILabel?
    @IBOutlet weak var lblname: UILabel?
    @IBOutlet weak var lblcoun: UILabel?
    @IBOutlet weak var lbltime: UILabel?
    @IBOutlet weak var lbltemp: UILabel?
    @IBOutlet weak var imgicon: UIImageView?
    @IBOutlet weak var lbldesc: UILabel?
    @IBOutlet weak var lbldoC: UILabel?
    var params = [:] as [String: Any]
    //Day la son3
    
    //day la son2
    //day
    static var manager: Alamofire.SessionManager = {
        let trust: [String: ServerTrustPolicy] = [
            "api.weatherstack.com": .disableEvaluation
        ]
        
        let manager = Alamofire.SessionManager (
            configuration: URLSessionConfiguration.default, serverTrustPolicyManager:
            ServerTrustPolicyManager(policies: trust)
        )
        return manager
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ViewController.manager.request("http://api.weatherstack.com/current?access_key=f5c3f2d150ca9c5efff0dcd06a9205e3", method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseObject{ (response: DataResponse<MyResponse>) in
            switch response.result {
            case .success(let response):
                print(response.request?.type ?? "type")
                
                self.lblcity?.text = response.request?.type ?? "type"
                self.lblname?.text = response.loca?.name ?? "name"
                self.lblcoun?.text = response.loca?.coun ?? "coun"
                self.lbltime?.text = "\(String(describing: response.loca?.time ?? ""))"
                self.lbltemp?.text = "\(response.curr?.temp ?? 0 )"
                self.lbldesc?.text = response.curr?.getclao()[0] ?? ""
                let strinurl = response.curr?.geticon()[0] ?? ""
                print(strinurl)
                self.lbldoC?.text = "o"
                self.imgicon?.load(url: URL(string: strinurl)!)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

