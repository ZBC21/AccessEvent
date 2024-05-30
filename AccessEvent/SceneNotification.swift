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
        Notification(title: "A post by an employee at LinkedIn is popular", subtitle: "CTV is growing quickly and for good reason. B2B Marketers want to be able to take advantage of this trend.", time: "1h", reactions: 400, comments: 36),
        Notification(title: "LinkedIn News Europe posted", subtitle: "Welcome to the Wrap-Up – your summary of the day’s top news and talking points, curated by LinkedIn.", time: "5h", reactions: 0, comments: 0),
        Notification(title: "The gender bias in medical terminology", subtitle: "The gender bias in medical terminology has far-reaching implications for women's health, says this doctor.", time: "6h", reactions: 0, comments: 0),
        Notification(title: "Universidad Europea posted", subtitle: "La #UniversidadEuropea celebra con orgullo los diez años de la primera promoción de Medi...", time: "6h", reactions: 0, comments: 0),
        Notification(title: "Having AI know-how can earn you more money", subtitle: "Having AI know-how can earn you more money, new research shows.", time: "7h", reactions: 0, comments: 0),
        Notification(title: "Bending Spoons is hiring", subtitle: "Software Engineer, Internship. See this and 5 other job recommendations.", time: "7h", reactions: 0, comments: 0),
        Notification(title: "Want to make better decisions?", subtitle: "Ask better questions. Try using this framework.", time: "8h", reactions: 0, comments: 0)
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
