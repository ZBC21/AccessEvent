//
//  ScenePersonalData.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 26/5/24.
//

import UIKit

enum AccountSettingType {
    case text(value: String)
    case gender(value: Gender)
}

enum Gender {
    case male
    case female
    case other
}

struct AccountSetting {
    let title: String
    var type: AccountSettingType
}


class AccountViewController: UITableViewController {

    var settings = [
        AccountSetting(title: "Nombre", type: .text(value: "")),
        AccountSetting(title: "Apellido", type: .text(value: "")),
        AccountSetting(title: "Dirección", type: .text(value: "")),
        AccountSetting(title: "E-Mail", type: .text(value: "")),
        AccountSetting(title: "Género", type: .gender(value: .male))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cuenta"
        self.view.backgroundColor = .white
        tableView.register(TextFieldTableViewCellP.self, forCellReuseIdentifier: "textFieldCell")
        tableView.register(GenderPickerTableViewCell.self, forCellReuseIdentifier: "genderCell")
        tableView.tableFooterView = createFooterView()
    }

    func createFooterView() -> UIView {
        let footerView = UIView()
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Guardar Cambios", for: .normal)
        saveButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            saveButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor)
        ])
        
        footerView.frame.size.height = 100
        return footerView
    }

    @objc func saveChanges() {
        // Implement saving functionality here
        print("Changes saved")
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell", for: indexPath) as? TextFieldTableViewCellP else {
                fatalError("Unable to dequeue TextFieldTableViewCellP")
            }
            cell.textLabel?.text = setting.title
            cell.textField.text = value
            return cell
        case .gender(let value):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "genderCell", for: indexPath) as? GenderPickerTableViewCell else {
                fatalError("Unable to dequeue GenderPickerTableViewCell")
            }
            cell.textLabel?.text = setting.title
            cell.configure(with: value)
            return cell
        }
    }
}


class TextFieldTableViewCellP: UITableViewCell {
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

class GenderPickerTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    let pickerView = UIPickerView()
    let genders: [Gender] = [.male, .female, .other]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        pickerView.delegate = self
        pickerView.dataSource = self

        pickerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pickerView)
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            pickerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            pickerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            pickerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with gender: Gender) {
        if let index = genders.firstIndex(of: gender) {
            pickerView.selectRow(index, inComponent: 0, animated: false)
        }
    }

    // UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }

    // UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch genders[row] {
        case .male:
            return "Hombre"
        case .female:
            return "Mujer"
        case .other:
            return "Otro"
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Handle gender selection change if needed
    }
}



// Preview for SwiftUI
import SwiftUI

struct AccountViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = AccountViewController()
        return UINavigationController(rootViewController: viewController)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

#if DEBUG
struct AccountViewController_Previews: PreviewProvider {
    static var previews: some View {
        AccountViewControllerPreview()
    }
}
#endif


