//
//  ViewController.swift
//  auto layout course - Lab 2 on Content Hugging and Content Resistance (cover + album title)
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
        let image = makeImageView(named: "rush")
        let label = makeLabel(withText: "Title")
        let button = makeButton(withText: "Get Started")

        view.addSubview(image)
        view.addSubview(label)
        view.addSubview(button)
        
//        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 300).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)

        // By making the image hug itself a little bit less and less resistant to being compressed we allow the image to stretch and grow as required
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        return view
    }

    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .yellow

        return label
    }
    
    func makeButton(withText text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        button.configuration = config
        return button
    }
}
