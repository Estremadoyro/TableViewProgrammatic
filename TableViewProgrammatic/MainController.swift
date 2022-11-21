//
//  ViewController.swift
//  TableViewProgrammatic
//
//  Created by Leonardo  on 20/11/22.
//

import UIKit

final class MainController: UIViewController {
    // MARK: State
    /// # ViewModel
    private let viewModel = MainViewModel()
    
    private static let cellId: String = "CELL_ID"

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        return tableView
    }()

    // MARK: Initializers
}

// MARK: Life Cycle
extension MainController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CatCell.self, forCellReuseIdentifier: Self.cellId)
        tableView.dataSource = self
        setupUI()
    }
}

// MARK: UI
private extension MainController {
    func setupUI() {
        view.backgroundColor = .systemPink
        layoutTableView()
    }

    /// Constraints of TableView
    func layoutTableView() {
        tableView.backgroundColor = .systemBlue

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0)
        ])
    }
}

// MARK: DataSource
extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // crear celda
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellId, for: indexPath) as? CatCell else { fatalError("Unable to dequeue CatCell") }
        
        let cat: Cat = viewModel.dummyCats[indexPath.row]
        cell.setupCell(cat: cat)
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dummyCats.count
    }
}
