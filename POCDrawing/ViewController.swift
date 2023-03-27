//
//  ViewController.swift
//  POCDrawing
//
//  Created by Paulo Henrique Gomes da Silva on 26/03/23.
//

import UIKit

class ViewController: UIViewController {

    let drawView = DrawView()

    override func loadView() {
        view = drawView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        drawView.didTapHandler = { [weak self] in
            guard let image = self?.renderViewImage() else { return }
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }

    func renderViewImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { ctx in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        return image
    }
}

