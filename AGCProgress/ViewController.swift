//
//  ViewController.swift
//  AGCProgress
//
//  Created by hope on 2017/12/6.
//  Copyright © 2017年 Halsey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setRing()
    }
    
    func setRing(){
        let ringView = AngleGradientRingView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        ringView.center = view.center
        view.addSubview(ringView)
        ringView.setPercent(percent: 100, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

