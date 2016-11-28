//
//  BoardView.swift
//  GameLife2
//
//  Created by Bhavik Nagda on 11/26/16.
//  Copyright © 2016 stulinProject. All rights reserved.
//

import Foundation
import UIKit

class BoardView: UIView{
    var c: Colony
    var tapRec: UITapGestureRecognizer
    var height: Double = 0.0
    var width: Double = 0.0
    
    init(frame: CGRect, colony: Colony) {
        c = colony
        tapRec = UITapGestureRecognizer()
        super.init(frame: frame)
        tapRec = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapRec)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect){
        let square_height = Double(rect.height)/60
        let square_width = Double(rect.width)/60
        
        height = square_height
        width = square_width
        
        
        for x in 0...59{
            for y in 0...59{
                let rect = CGRect(x: Double(x) * square_width, y: Double(y) * square_height, width: square_width, height: square_height)
                                
                if(c.isCellAlive(x, yCoor: y)){
                    let thisView = UIView(frame: rect)
                    thisView.backgroundColor = UIColor.blue
                    self.addSubview(thisView)
                } else {
                    let thisView = UIView(frame: rect)
                    thisView.backgroundColor = UIColor.yellow
                    self.addSubview(thisView)
                }
            }
        }
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("touch")
            let location = sender.location(in: self)
            print(location.x)
            print(location.y)
            
            let xCoor = Int(Double(location.x)/width)
            let yCoor = Int(Double(location.y)/height)
                
            if(c.isCellAlive(xCoor, yCoor: yCoor)){
                c.setCellDead(xCoor, yCoor: yCoor)
            } else {
                c.setCellAlive(xCoor, yCoor: yCoor)
            }
            self.setNeedsDisplay()
            
        
        }
    }
    
    
}
