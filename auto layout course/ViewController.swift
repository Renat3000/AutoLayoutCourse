//
//  ViewController.swift
//  auto layout course - Spotify player challenge, on Content Hugging and Content Resistance
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

//         Comment in incrementally...
                let albumImage = makeImageView(named: "rush")
                let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
                let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
                let playButton = makePlayButton()
                let previewStartLabel = makePreviewLabel(withText: "0:00")
                let previewEndLabel = makePreviewLabel(withText: "0:30")
                let progressView = makeProgressView()
                let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
                view.addSubview(albumImage)
                view.addSubview(trackLabel)
                view.addSubview(albumLabel)
                view.addSubview(playButton)
                view.addSubview(previewStartLabel)
                view.addSubview(progressView)
                view.addSubview(previewEndLabel)
                view.addSubview(spotifyButton)

        // Start your layout here...
        albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//          My solution
//          albumImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//          albumImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//          albumImage.widthAnchor.constraint(equalTo: albumImage.heightAnchor).isActive = true
//          Jonathan's Solution
        
        albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1).isActive = true // keep ration 1:1
        albumImage.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true //make the picture as wide as the screen
        

        trackLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: 8).isActive = true
        trackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: 8).isActive = true
        albumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        playButton.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: 8).isActive = true
        playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.heightAnchor.constraint(equalTo: playButton.widthAnchor).isActive = true
        
        previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8).isActive = true
        
        progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: 8).isActive = true
        
        previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        previewEndLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8).isActive = true
        previewEndLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        spotifyButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 32).isActive = true
        spotifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func makeImageView(named: String) -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: named)

        // By making the image hug itself a little bit less and less resistant to being compressed
        // we allow the image to stretch and grow as required
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for: .vertical)
        view.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)

        return view
    }

    func makeTrackLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)

        return label
    }

    func makeAlbumLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray

        return label
    }

    func makePlayButton() -> UIButton {
        let image = UIImage(named: "play") as UIImage?

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)

        return button
    }

    func makePreviewLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)

        return label
    }

    func makeProgressView() -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.tintColor = .gray

        return progressView
    }

    func makeSpotifyButton(withText title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .spotifyGreen
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40)
        button.configuration = config

        let attributedText = NSMutableAttributedString(string: title, attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.kern: 1
            ])

        button.setAttributedTitle(attributedText, for: .normal) // Note how not button.setTitle()

        return button
    }
}
extension UIColor {
    static let spotifyGreen = UIColor(red: 28/255, green: 184/255, blue: 89/255, alpha: 1)
}
