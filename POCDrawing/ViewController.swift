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
        // Do any additional setup after loading the view.
    }


}

