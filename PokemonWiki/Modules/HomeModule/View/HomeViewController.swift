//
//  ViewController.swift
//  PokemonWiki
//
//  Created by murphy on 17.11.2023.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    
    var output: HomeViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pokemonTable.delegate = self
        pokemonTable.dataSource = self
        pokemonTable.register(UITableViewCell.self, forCellReuseIdentifier: "pokemonTableCell")
        configureLayout()
    }
    
    private var pokemons = ["1", "2", "3", "4"]
    
    private lazy var pokemonTable: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .yellow
    
        return table
    }()
}

private extension HomeViewController {
    func configureLayout() {
        [pokemonTable].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        configureConstraints()
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            pokemonTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonTable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pokemonTable.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            pokemonTable.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonTableCell", for: indexPath as IndexPath)
        cell.textLabel?.text = pokemons[indexPath.row]
        return cell
    }
}
