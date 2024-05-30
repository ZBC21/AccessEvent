//
//  SceneSettings.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 23/5/24.
//

import SwiftUI
import UIKit

struct SettingItem {
    let icon: UIImage?
    let title: String
}

import UIKit

class SettingTableViewCell: UITableViewCell {
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let arrowImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
    
    var iconColor: UIColor = .black {
        didSet {
            iconImageView.tintColor = iconColor
        }
    }
    
    var arrowColor: UIColor = .black {
        didSet {
            arrowImageView.tintColor = iconColor
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Configure the image view
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // Configure the label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        // Configure the image view for the arrow
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrowImageView)
        NSLayoutConstraint.activate([
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 20),
            arrowImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with item: SettingItem) {
        titleLabel.text = item.title
        iconImageView.image = item.icon
        iconImageView.tintColor = iconColor
        arrowImageView.tintColor = arrowColor
    }
}

import UIKit
import SwiftUI

class SettingsViewController: UITableViewController {
    var userSession: UserSession
    
    let section1: [SettingItem] = [
        SettingItem(icon: UIImage(systemName: "person"), title: "Datos Personales"),
        SettingItem(icon: UIImage(systemName: "bell"), title: "Notifications"),
        SettingItem(icon: UIImage(systemName: "key"), title: "Seguridad")
    ]

    let section2: [SettingItem] = [
        SettingItem(icon: UIImage(systemName: "arrow.backward.circle"), title: "Cerrar Sesión")
    ]
    
    init(userSession: UserSession) {
        self.userSession = userSession
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ajustes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingCell")
        tableView.separatorColor = .lightGray
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? section1.count : section2.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingTableViewCell
        let item = indexPath.section == 0 ? section1[indexPath.row] : section2[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let destinationViewController: UIViewController
            switch indexPath.row {
            case 0:
                destinationViewController = AccountViewController()
            case 1:
                destinationViewController = SettingNotificationsViewController()
            case 2:
                destinationViewController = SecurityViewController()
            default:
                return
            }
            self.navigationController?.pushViewController(destinationViewController, animated: true)
        } else if indexPath.section == 1 {
            userSession.isLoggedIn = false
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "\n" : "\n"
    }
}

extension SettingsViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}



struct SettingsViewControllerPreview: UIViewControllerRepresentable {
    @EnvironmentObject var userSession: UserSession

    func makeUIViewController(context: Context) -> UIViewController {
        let settingsVC = SettingsViewController(userSession: userSession)
        let navigationController = UINavigationController(rootViewController: settingsVC)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

#if DEBUG
struct SettingsViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        SettingsViewControllerPreview()
            .environmentObject(UserSession())
    }
}

#endif
