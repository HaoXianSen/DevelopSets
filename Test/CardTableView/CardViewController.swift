//
//  CardViewController.swift
//  Test
//
//  Created by 郝玉鸿 on 2025/11/18.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = [["圆角、边框、阴影分组卡片实现", "圆角、边框、阴影分组卡片实现", "圆角、边框、阴影分组卡片实现"], ["圆角、边框、阴影分组卡片实现", "圆角、边框、阴影分组卡片实现"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CornerTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension CardViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CornerTableViewCell
        cell.update(with: dataSource[indexPath.section])
        return cell
    }
}
