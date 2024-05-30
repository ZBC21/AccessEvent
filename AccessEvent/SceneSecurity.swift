//
//  SceneSecurity.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 26/5/24.
//

import UIKit

enum SettingType {
    case text(value: String)
    case toggle(isOn: Bool)
}

struct Setting {
    let title: String
    var type: SettingType
}

class SecurityViewController: UITableViewController {

    var settings = [
        Setting(title: "Contraseña", type: .text(value: "")),
        Setting(title: "Confirmar Contraseña", type: .text(value: "")),
        Setting(title: "Verificación dos pasos", type: .toggle(isOn: false))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Seguridad"
        self.view.backgroundColor = .white
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "textFieldCell")
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: "switchCell")
        tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.row]

        switch setting.type {
        case .text(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as! TextFieldTableViewCell
            cell.textLabel?.text = setting.title
            cell.textField.text = value
            return cell
        case .toggle(let isOn):
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchTableViewCell
            cell.textLabel?.text = setting.title
            cell.switchView.isOn = isOn
            cell.switchView.tag = indexPath.row
            cell.switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
            return cell
        }
    }

    @objc func switchChanged(_ sender: UISwitch) {
        let index = sender.tag
        settings[index].type = .toggle(isOn: sender.isOn)
        // Handle the switch change as needed
    }
}

class TextFieldTableViewCell: UITableViewCell {
    let textField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        textField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        textField.borderStyle = .roundedRect
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SwitchTableViewCell: UITableViewCell {
    let switchView = UISwitch()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryView = switchView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Preview for SwiftUI
import SwiftUI

struct SecurityViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = SecurityViewController()
        return UINavigationController(rootViewController: viewController)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct SecurityViewController_Previews: PreviewProvider {
    static var previews: some View {
        SecurityViewControllerPreview()
            .edgesIgnoringSafeArea(.all)
    }
}

