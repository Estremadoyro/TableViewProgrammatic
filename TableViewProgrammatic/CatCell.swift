//
//  CatCell.swift
//  TableViewProgrammatic
//
//  Created by Leonardo  on 20/11/22.
//

import UIKit

final class CatCell: UITableViewCell {
    // MARK: State
    private lazy var container: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.systemGreen
        contentView.addSubview(container)
        return container
    }()

    private lazy var breedLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .systemYellow
        label.backgroundColor = .systemGray
        container.addSubview(label)
        return label
    }()
    
    // MARK: Initializers

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .systemPink
        setupUI()
    }
    
    
    // MARK: Methods
    func setupCell(cat: Cat) {
        breedLabel.text = cat.breedName
    }
    
    private func setupUI() {
        // Container
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.topAnchor.constraint(equalTo: contentView.topAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Breed
        NSLayoutConstraint.activate([
            breedLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10.0),
            breedLabel.topAnchor.constraint(equalTo: container.topAnchor),
            breedLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}
