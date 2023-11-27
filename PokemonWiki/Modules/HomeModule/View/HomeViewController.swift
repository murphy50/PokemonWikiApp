//
//  ViewController.swift
//  PokemonWiki
//
//  Created by murphy on 17.11.2023.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    
    var output: HomeViewOutput!
    
    func showPokemon()  {
        self.pokemonTableView.reloadData()
        if output.source == .localeStorage(isAlreadyFetched: true) {
            removeActivityIndicator()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        configureLayout()
    }
    
    private lazy var pokemonTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .yellow
        table.register(UITableViewCell.self, forCellReuseIdentifier: "pokemonTableCell")
        let imageView = UIImageView(image: UIImage(resource: .pokemonLogo))
        imageView.contentMode = .scaleAspectFit
        table.tableHeaderView = imageView
        return table
    }()
    
    private lazy var pagingSpinner = {
        let pagingSpinner = UIActivityIndicatorView(style: .medium)
        pagingSpinner.startAnimating()
        pagingSpinner.color = .red
        pagingSpinner.hidesWhenStopped = false
        return pagingSpinner
    }()
    
    private func showActivityIndicator() {
        pokemonTableView.tableFooterView = pagingSpinner
    }
    
    private func removeActivityIndicator() {
        pokemonTableView.tableFooterView = nil
    }
}

private extension HomeViewController {
    func configureLayout() {
        [pokemonTableView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        configureConstraints()
    }
    func configureConstraints() {
        NSLayoutConstraint.activate([
            pokemonTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonTableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pokemonTableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            pokemonTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didPressedCell(with: indexPath.row)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == output.pokemonArray.count - 1 {
            output.loadMorePokemon()
            if output.source  == .network {
                showActivityIndicator()
            }
            print(1)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonTableCell", for: indexPath)
        cell.textLabel?.text = output.pokemonArray[indexPath.row].name
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        cell.imageView?.image = UIImage(resource: .pokeball)
        return cell
    }
}
