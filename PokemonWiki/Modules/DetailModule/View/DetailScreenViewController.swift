//
//  DetailScreenDetailScreenViewController.swift
//  PokemonWiki
//
//  Created by murphy50 on 23/11/2023.
//  Copyright © 2023 a. All rights reserved.
//

import UIKit

class DetailScreenViewController: UIViewController, DetailScreenViewInput {

    var output: DetailScreenViewOutput!

    private let pokemon: Pokemon
    
    lazy var cardStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .yellow
        stack.axis = .vertical
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(weightLabel)
        stack.addArrangedSubview(heightLabel)
        //stack.addArrangedSubview(typeStack)
        return stack
    }()
    lazy var imageView: UIImageView = {
        let image = UIImage(data: pokemon.image!)
        let imageView = UIImageView(image: image)
        return imageView
        
    }()
    lazy var weightLabel: UILabel = {
       let label = UILabel()
        label.text = String(pokemon.weight)
        return label
    }()
    lazy var heightLabel: UILabel = {
       let label = UILabel()
        label.text = String(pokemon.weight)
        return label
    }()
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = pokemon.name
        return label
    }()
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureLayout()
        //output.viewIsReady()
    }

    

    func setupInitialState() {
    }
}
private extension DetailScreenViewController {
    func configureLayout() {
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
            cardStack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            cardStack.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}
