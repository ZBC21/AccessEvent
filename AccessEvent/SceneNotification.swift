//
//  SceneNotification.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 27/5/24.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let timeLabel = UILabel()
    let reactionsLabel = UILabel()
    let commentsLabel = UILabel()
    let optionsButton = UIButton(type: .system)
    let thumbnailImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .light)
        subtitleLabel.numberOfLines = 2
        timeLabel.font = .systemFont(ofSize: 12, weight: .light)
        reactionsLabel.font = .systemFont(ofSize: 12, weight: .regular)
        commentsLabel.font = .systemFont(ofSize: 12, weight: .regular)

        optionsButton.setTitle("...", for: .normal)
        optionsButton.titleLabel?.font = .systemFont(ofSize: 24)

        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.image = UIImage(systemName: "photo.artframe") // Placeholder image

        let textStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 4

        let reactionsStackView = UIStackView(arrangedSubviews: [reactionsLabel, commentsLabel])
        reactionsStackView.axis = .horizontal
        reactionsStackView.spacing = 8

        let centralStackView = UIStackView(arrangedSubviews: [textStackView, reactionsStackView])
        centralStackView.axis = .vertical
        centralStackView.spacing = 8

        let timeOptionsStackView = UIStackView(arrangedSubviews: [timeLabel, optionsButton])
        timeOptionsStackView.axis = .vertical
        timeOptionsStackView.spacing = 4
        timeOptionsStackView.alignment = .trailing

        let mainStackView = UIStackView(arrangedSubviews: [thumbnailImageView, centralStackView, timeOptionsStackView])
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.spacing = 8
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 40),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 40),
            
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with notification: Notification) {
        titleLabel.text = notification.title
        subtitleLabel.text = notification.subtitle
        timeLabel.text = notification.time
        reactionsLabel.text = "\(notification.reactions) reactions"
        commentsLabel.text = "\(notification.comments) comments"
    }
}

struct Notification {
    let title: String
    let subtitle: String
    let time: String
    let reactions: Int
    let comments: Int
}

class NotificationsViewController: UITableViewController {

    var notifications = [
        //cambiar estas notificaciones
        Notification(title: "Actualización del Evento:", subtitle: "El evento ha actualizado su fecha/hora", time: "1h", reactions: 400, comments: 36),
        Notification(title: "Recordatorio del Evento", subtitle: "No olvides que el evento comienza en una hora", time: "5h", reactions: 10, comments: 3),
        Notification(title: "Cambio de Ubicación", subtitle: "Iportante: Tu evento ha cambiado de ubicación", time: "15h", reactions: 1, comments: 5),
        Notification(title: "Recordatorio de Inscripción", subtitle: "Última oportunidad para inscribirte en Opera inclusiva", time: "1d", reactions: 3, comments: 4),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notificaciones"
        self.view.backgroundColor = .white
        tableView.register(NotificationTableViewCell.self, forCellReuseIdentifier: "notificationCell")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notification = notifications[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as? NotificationTableViewCell else {
            fatalError("Unable to dequeue NotificationTableViewCell")
        }
        cell.configure(with: notification)
        return cell
    }
}


import SwiftUI

struct NotificationsViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = NotificationsViewController()
        return UINavigationController(rootViewController: viewController)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

#if DEBUG
struct NotificationsViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        NotificationsViewControllerPreview()
    }
}
#endif
