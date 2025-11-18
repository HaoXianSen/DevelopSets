//
//  CornerTableViewCell.swift
//  Test
//
//  Created by 郝玉鸿 on 2025/10/31.
//

import UIKit
import SnapKit

class CornerTableViewCell: UITableViewCell {

    private lazy var sizedTableView = getTableView()
    
    private var dataSource: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        let containerView = UIView(frame: .zero)
        containerView.layer.cornerRadius = 10
        containerView.layer.shadowColor = rgbaHexColor(0xC7CBDE, 0.64).cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 8)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 30
        containerView.backgroundColor = .white
        contentView.addSubview(containerView)
        containerView.addSubview(sizedTableView)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        sizedTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func update(with titles: [String]) {
        dataSource = titles
        sizedTableView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func getTableView() -> CardSizedTableView {
        let tableView = CardSizedTableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        return tableView
    }
}

extension CornerTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        cell.title = dataSource[indexPath.row]
        return cell
    }
    
    
}
