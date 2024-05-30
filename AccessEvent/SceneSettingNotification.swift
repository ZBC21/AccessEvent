//
//  SceneSettingNotification.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 26/5/24.
//

import UIKit

class SettingNotificationsViewController: UITableViewController {

    var preferencesSection = [
        ("Notificaciones push en el navegador", false),
        ("Notificaciones por E-mail", false)
    ]
    
    var typesSection = [
        ("Eventos y actualizaciones de cuenta", false),
        ("Notificaciones de seguridad", false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notificaciones"
        self.view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView() // Elimina las líneas de separación de las celdas vacías
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? preferencesSection.count : typesSection.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Preferencias de notificación:" : "Tipos de notificación:"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let (title, isOn) = indexPath.section == 0 ? preferencesSection[indexPath.row] : typesSection[indexPath.row]
        
        cell.textLabel?.text = title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(isOn, animated: true)
        switchView.tag = indexPath.section * 100 + indexPath.row
        switchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchView
        
        return cell
    }

    @objc func switchChanged(_ sender: UISwitch) {
        let section = sender.tag / 100
        let row = sender.tag % 100
        
        if section == 0 {
            preferencesSection[row].1 = sender.isOn
        } else {
            typesSection[row].1 = sender.isOn
        }
        

    }
}

// Preview para SwiftUI
import SwiftUI
struct SettingNotificationsViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = NotificationsViewController()
        return UINavigationController(rootViewController: viewController)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

struct SettingNotificationsViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        NotificationsViewControllerPreview()
            .edgesIgnoringSafeArea(.all)
    }
}
