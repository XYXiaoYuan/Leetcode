//: [Previous](@previous)

import UIKit
import Foundation
import PlaygroundSupport

let rootViewController = ViewController()
let nav = UINavigationController(rootViewController: rootViewController)
PlaygroundPage.current.liveView = nav

/// 列表组`协议`
protocol TableSection {
    /// tableView的 rows
    static var rows: [Self] { get }

    /// tableView 每个row的标题
    var title: String { get }

    /// 是否是必须输入的字段
    var mandatoryField: Bool { get }
}

extension TableSection {
    /// 给`协议TableSection`扩展一个属性mandatoryTitle
    /// 如果是必须输入的字段,后面带 *
    var mandatoryTitle: String {
        if mandatoryField {
            return "\(title)*"
        } else {
            return title
        }
    }
    
    /// 默认实现`协议TableSection`TableSection
    static var rows: [RegisterTableSection] {
        return RegisterTableSection.allCases.filter { $0.mandatoryField == true }
    }
}

/// 注册列表组`枚举`, 遵守`协议`TableSection
enum RegisterTableSection: Int, CaseIterable, TableSection {
    case username
    case birthdate
    case password
    case repeatpassword
    
    /// 实现`协议TableSection`title
    var title: String {
        switch self {
        case .username:
            return "username"
        case .birthdate:
            return "date of birth"
        case .password:
            return "password"
        case .repeatpassword:
            return "Repeat password"
        }
    }
    
    /// 实现`协议TableSection`mandatoryField
    var mandatoryField: Bool {
        switch self {
        case .username:
            return true
        case .birthdate:
            return false
        case .password:
            return true
        case .repeatpassword:
            return true
        }
    }
}

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RegisterTableSection.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = RegisterTableSection(rawValue: indexPath.row) else {
            // This should never happen
            return UITableViewCell()
        }

        let cell = UITableViewCell()
        cell.textLabel?.text = row.mandatoryTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


//: [Next](@next)
