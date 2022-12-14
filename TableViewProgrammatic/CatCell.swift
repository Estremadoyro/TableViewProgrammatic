//
//  CatCell.swift
//  TableViewProgrammatic
//
//  Created by Leonardo  on 20/11/22.
//

import UIKit

final class CatCell: UITableViewCell {
    // MARK: State
    static let reuseIdentifier: String = "CELL_ID"

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
    /// This will only be run a few times as the cells get reused instead of re-initialized. Should only setupUI() style that is static and should need updates afterwards
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Always reset values before reusing a cell to save memory
    override func prepareForReuse() {
        super.prepareForReuse()
        breedLabel.text = nil
    }
    
    /// **IMPORANT** awakeFormNib should only be used along with *Xibs or Storyboards* otherwise awakeFromNib will not be called inmediatly.

    // MARK: Methods
    /// Setup dynamic cell-index dependant updates.
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
