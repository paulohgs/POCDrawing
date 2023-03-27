//
//  DrawView.swift
//  POCDrawing
//
//  Created by Paulo Henrique Gomes da Silva on 26/03/23.
//

import UIKit

class DrawView: UIView {

    var didTapHandler: (() -> Void)?

    private let canvasView: CanvasView = {
        let view  = CanvasView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.configuration = .bordered()
        button.setTitle("Render Image", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        nil
    }

    @objc func didTapButton(_ sender: UIButton) {
        didTapHandler?()
    }

}

extension DrawView: ViewCode {
    func setupView() {
        backgroundColor = .black
    }

    func setupHierarchy() {
        addSubview(canvasView)
        addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // canvas constraints
            canvasView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            canvasView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            canvasView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            // button constraints
            button.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 10),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 135),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}
