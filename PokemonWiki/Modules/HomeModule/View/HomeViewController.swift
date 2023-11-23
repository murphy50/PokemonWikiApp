//
//  ViewController.swift
//  PokemonWiki
//
//  Created by murphy on 17.11.2023.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {
    
    
    func showPokemon()  {
        self.pokemonTableView.reloadData()
        print("view count \(output.pokemonArray.count)")
        print(2)
        removeActivityIndicator()
    }
    
    var presenter: HomeViewOutput!
    
    var output: HomeViewOutput!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokemonTableCell")
        configureLayout()
    }
    
    
    private lazy var pokemonTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.backgroundColor = .yellow
    
        return table
    }()
    
   
    lazy var pagingSpinner = {
        let pagingSpinner = UIActivityIndicatorView(style: .medium)
        pagingSpinner.startAnimating()
        pagingSpinner.color = .red//UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        pagingSpinner.hidesWhenStopped = false
        return pagingSpinner
    }()
    
    func showActivityIndicator() {
      
        pokemonTableView.tableFooterView = pagingSpinner

    }
    func removeActivityIndicator() {
        //pagingSpinner.stopAnimating()
        //indicatorView.stopAnimating()
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
            showActivityIndicator()
            print(1)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonTableCell", for: indexPath as IndexPath)
        cell.textLabel?.text = output.pokemonArray[indexPath.row].name
        return cell
    }
  
}
