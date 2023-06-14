//
//  ViewController.swift
//  auto layout course
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
        //upperLeftLabel
        let upperLeftLabel = makeLabel(withText: "upperLeft")
        view.addSubview(upperLeftLabel)
        upperLeftLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true // safeAreaLayoutGuide to avoid safeArea (the notch area)
        upperLeftLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        //upperRightLabel
        let upperRightLabel = makeLabel(withText: "upperRight")
        view.addSubview(upperRightLabel)
        upperRightLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        upperRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true // -8 cause it's the trailing side
        
        //lowerLeft secondary label
        let lowerLeft = makeSecondaryLabel(withText: "lowerLeft")
        view.addSubview(lowerLeft)
        lowerLeft.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true // -8 cause it's the bottom side
        lowerLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        //payBill button
        let payBill = makeButton(withText: "Pay Bill")
        view.addSubview(payBill)
        payBill.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        payBill.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        //redView
        let redView = makeView()
        view.addSubview(redView)
        
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        redView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true 
        
        //with views we always have to specify height and width
        
        //option 1: size explicitly
//        redView.heightAnchor.constraint(equalToConstant: 500).isActive = true //equalToConstant so we can equate it to a number
//        redView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        //option 2: size dynamically
        //width
        redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        //height
        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // important
        label.text = text
        label.backgroundColor = .systemYellow
        
        return label
    }
    
    func makeSecondaryLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemYellow
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)
        button.backgroundColor = .blue
        
        return button
    }
    
    func makeView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }
}

