//
//  DetailScreenDetailScreenViewController.swift
//  PokemonWiki
//
//  Created by murphy50 on 23/11/2023.
//  Copyright © 2023 a. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController, DetailScreenViewInput {
    func showEntity() {
        guard let entity = output.entity else { return }
        view.backgroundColor = entity.types.first?.color()
        for (index, type) in entity.types.enumerated() {
                let label = UILabel()
                label.text = " Type \(index+1): \(type.rawValue)"
                label.layer.borderColor = UIColor.systemGray2.cgColor
                label.layer.cornerRadius = 8
                label.layer.borderWidth = 1.5
                    
                label.font = .systemFont(ofSize: 25)
                label.backgroundColor = type.color()
                cardStack.addArrangedSubview(label)
            }
        if let image = entity.image {
            imageView.image = UIImage(data: image)
        }
        weightLabel.text = "Weight:   \(entity.weight)"
        heightLabel.text = "Height:   \(entity.height)"
        nameLabel.text = entity.name
        //configureConstraints()
        //view.setNeedsLayout()
        cardStack.isHidden = false
        activityIndicator.stopAnimating()
    }
    

    var output: DetailScreenViewOutput!

    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style  = .large
        activityIndicator.color = .red
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    lazy var cardStack: UIStackView = {
        let stack = UIStackView()
//        stack.layoutMargins = .init(top: 100, left: 100, bottom: 100, right: 100)
//        stack.isLayoutMarginsRelativeArrangement = true
        if let entity = output.entity {
            stack.backgroundColor = entity.types.first?.color()
        }

        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(weightLabel)
        stack.addArrangedSubview(heightLabel)
        stack.addArrangedSubview(typeStack)
        stack.axis = .vertical
        return stack
    }()
    
    lazy var typeStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        if let entity = output.entity {
            for type in entity.types {
                let label = UILabel()
                label.text = type.rawValue
                label.backgroundColor = type.color()
                stack.addArrangedSubview(label)
            }
        }
        return stack
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        if let entity = output.entity, let image = entity.image {
            imageView.image = UIImage(data: image)
        }
        return imageView
    }()
    lazy var weightLabel: UILabel = {
       let label = UILabel()
        if let entity = output.entity {
            label.text = "Weight: \(entity.weight)"
        }
        label.font = .systemFont(ofSize: 25)

        return label
    }()
    lazy var heightLabel: UILabel = {
       let label = UILabel()
        if let entity = output.entity {
            label.text = "Height: \(entity.height)"
        }
        label.font = .systemFont(ofSize: 25)

        return label
    }()
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        if let entity = output.entity {
            label.text = entity.name
        }
        label.font = .boldSystemFont(ofSize: 50.0)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        configureLayout()
        cardStack.isHidden = true
    }

}
private extension DetailScreenViewController {
    func configureLayout()  {
        [cardStack].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
       configureConstraints()
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            cardStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardStack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -50),
            cardStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -50),
        ])
    }
}
