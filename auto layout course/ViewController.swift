//
//  ViewController.swift
//  auto layout course - UILayoutGuide as Spacer Views
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
        
        //create controls
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(title: "OK", color: .darkBlue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(title: "Cancel", color: .darkGreen)
        let trailingGuide = UILayoutGuide()
        
        //add to subviews & layout guide
        view.addSubview(okButton)
        view.addSubview(cancelButton)
        view.addLayoutGuide(leadingGuide) //we add guides differently, not through .addSubview, but .addLayoutGuide
        view.addLayoutGuide(middleGuide)
        view.addLayoutGuide(trailingGuide)
        
        //setup constraints
        let margins = view.layoutMarginsGuide
        
        //setup leadingGuide
        margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor).isActive = true
        leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor).isActive = true
        
        //setup middleGuide
        okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor).isActive = true
        middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor).isActive = true
        
        //setup trailingGuide
        cancelButton.trailingAnchor.constraint(equalTo: trailingGuide.leadingAnchor).isActive = true
        trailingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        //button equal widths
        okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
        
        //spacer equal widths
        leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor).isActive = true
        leadingGuide.widthAnchor.constraint(equalTo: trailingGuide.widthAnchor).isActive = true
        
        //vertical position
        leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trailingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //default height for guides
        leadingGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
        middleGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
        trailingGuide.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func makeButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 16, bottom: 8, right: 16) //'contentEdgeInsets' was deprecated in iOS 15.0: This property is ignored when using UIButtonConfiguration

        button.backgroundColor = color
        
        return button
    }
    

}

extension UIColor {
    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
}
