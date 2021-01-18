//
//  PieShape.swift
//  MemoryCardGame
//
//  Created by AP Aliaksandr Chekushkin on 1/18/21.
//

import SwiftUI


struct Pie: Shape {
    
    var startAngle: Angle
    var endangle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let start = CGPoint (
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians)))
        
        
        
        
        path.move(to: center)
        path.addLine(to: start)
        
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endangle,
                    clockwise: true)
        
        path.addLine(to: center)
        
        
        return path
    }
    
    
}
