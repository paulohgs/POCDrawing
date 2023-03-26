//
//  ViewController.swift
//  POCDrawing
//
//  Created by Paulo Henrique Gomes da Silva on 26/03/23.
//

import UIKit

class ViewController: UIViewController {

    let canvasView = CanvasView()

    override func loadView() {
        view = canvasView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

