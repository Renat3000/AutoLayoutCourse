//
//  ViewController.swift
//  auto layout course - Safe Areas Guides Lab
//
//  Created by Renat Nazyrov on 14.06.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    func setupViews() {
        let topLabel = makeLabel(withText: "Top Label")
        view.addSubview(topLabel)
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true // without safeAreaLayoutGuide this label in under the notch. it's there, but it's not visible
        topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let bottomLabel = makeLabel(withText: "Bottom Label")
        view.addSubview(bottomLabel)
        bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // safeAreaLayoutGuide for trailing and leading won't work (well, it won't change anything):
        // view.safeAreaLayoutGuide.trailingAnchor = view.trailingAnchor
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        
        return label
    }
}

