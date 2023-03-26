//
//  ViewCode.swift
//  POCDrawing
//
//  Created by Paulo Henrique Gomes da Silva on 26/03/23.
//

import Foundation

protocol ViewCode {
    func setupView()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewCode {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
