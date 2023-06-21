//
//  ViewController.swift
//  auto layout course - Lab on Content Hugging and Content Resistance
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
        let nameLabel = makeLabel(withText: "Name")
        let textField = makeTextField(withPlaceHolderText: "Enter name here")
    
        view.addSubview(nameLabel)
        view.addSubview(textField)
        
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        nameLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal) // content hugging priority. we've just bumped it from default 250 to 251. it's a property of label, not even a constraint.
        
        textField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8).isActive = true
        textField.firstBaselineAnchor.constraint(equalTo: nameLabel.firstBaselineAnchor).isActive = true // text baseline alignment
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        
        return label
    }
    
    func makeTextField(withPlaceHolderText text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = text
        textField.backgroundColor = .lightGray
        
        return textField
    }
}
