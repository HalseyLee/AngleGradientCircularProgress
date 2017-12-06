//
//  AngleGradientRingView.swift
//  AGCProgress
//
//  Created by hope on 2017/12/6.
//  Copyright © 2017年 Halsey. All rights reserved.
//

import UIKit

class AngleGradientRingView: UIView {

    var trackLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    var strokColor: UIColor!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        strokColor = UIColor.gray
        //MARK: - set you need startAngle endAngle  设置你的开始点 结束点
        let path = UIBezierPath(arcCenter: CGPoint(x:bounds.width/2,y:bounds.height/2), radius: 90, startAngle: degreesToRadians(angle: -210), endAngle: degreesToRadians(angle: 30), clockwise: true)
       
        trackLayer = CAShapeLayer()
        trackLayer.frame = bounds
        self.layer.addSublayer(trackLayer)
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = strokColor.cgColor
        trackLayer.opacity = 0.2
        trackLayer.lineCap = kCALineCapSquare
        trackLayer.lineWidth = 15
        trackLayer.path = path.cgPath
        
        progressLayer = CAShapeLayer()
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.cyan.cgColor
        progressLayer.lineCap = kCALineCapSquare
        progressLayer.lineWidth = 15
        progressLayer.strokeEnd = 0.0
        progressLayer.path = path.cgPath
        
        let gradientLayer = CALayer()
        
        //MARK: - leftGradientLayer 左边渐变层
        let leftGradientLayer = CAGradientLayer()
        leftGradientLayer.frame = CGRect(x: 0, y: 0, width: bounds.width/2, height: bounds.height)
        leftGradientLayer.colors = [UIColor(red: 62/255.0, green: 154/255.0, blue: 205/255.0, alpha: 0.01).cgColor,UIColor(red: 62/255.0, green: 154/255.0, blue: 205/255.0, alpha: 0.5).cgColor]
        leftGradientLayer.locations = [0.4,1];
        leftGradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        leftGradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.addSublayer(leftGradientLayer)
        
        //MARK: - rightGradientLayer 右边渐变层
        let rightGradientLayer = CAGradientLayer()
        rightGradientLayer.frame = CGRect(x: bounds.width/2, y: 0, width: bounds.width/2, height: bounds.height)
        rightGradientLayer.colors = [UIColor(red: 62/255.0, green: 154/255.0, blue: 205/255.0, alpha: 0.5).cgColor, UIColor(red: 62/255.0, green: 154/255.0, blue: 205/255.0, alpha: 1).cgColor]
        rightGradientLayer.locations = [0.2,1];
        rightGradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        rightGradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.addSublayer(rightGradientLayer)
        
        gradientLayer.mask = progressLayer
        self.layer.addSublayer(gradientLayer)
    }
    
    func degreesToRadians(angle: CGFloat) -> CGFloat {
        return CGFloat(Double.pi) * angle / 180.0
    }
    //MARK: - setProcess 设置进度
    func setPercent(percent: CGFloat, animated: Bool){
        CATransaction.begin()
        CATransaction.setDisableActions(!animated)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn))
        CATransaction.setAnimationDuration(1)
        progressLayer.strokeEnd = percent/100.0
        CATransaction.commit()
    }

}
