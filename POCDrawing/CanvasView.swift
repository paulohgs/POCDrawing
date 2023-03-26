//
//  CanvasView.swift
//  POCDrawing
//
//  Created by Paulo Henrique Gomes da Silva on 26/03/23.
//

import UIKit

struct TouchPoint {
    var color: UIColor?
    var points: [CGPoint]?

    init(color: UIColor, points: [CGPoint]?) {
        self.color = color
        self.points = points
    }
}

class CanvasView: UIView {

    var lines = [TouchPoint]()
    let strokeWidth = 1.0
    let strokeColor: UIColor = .white
    let strokeOpacity = 1.0

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }

        lines.forEach { (line) in

            for (i, p) in (line.points?.enumerated())! {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
                context.setStrokeColor(line.color?.withAlphaComponent(1.0).cgColor ?? UIColor.white.cgColor)
                context.setLineWidth(1.0)
            }
            context.setLineCap(.round)
            context.strokePath()

        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(TouchPoint(color: UIColor(), points: [CGPoint]()))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first?.location(in: nil) else { return }
        guard var lastPoint = lines.popLast() else { return }

        lastPoint.points?.append(touch)
        lastPoint.color = strokeColor
        lines.append(lastPoint)
        setNeedsDisplay()

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

}

extension CanvasView: ViewCode {
    func setupView() {
        backgroundColor = .black
    }

    func setupHierarchy() {

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

        ])
    }


}
