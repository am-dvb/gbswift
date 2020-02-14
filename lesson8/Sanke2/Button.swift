//
//  Button.swift
//  Sanke2
//
//  Created by Andrey on 14/02/2020.
//  Copyright © 2020 Pinspb. All rights reserved.
//

import Foundation

import UIKit
import SpriteKit

class Button: SKShapeNode {
    init(position: CGPoint, name: String) {
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        fillColor = UIColor.gray
        strokeColor = UIColor.gray
        lineWidth = 10
        self.name = name
        self.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
