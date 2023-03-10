//
//  SwiftEntryKitViewController.swift
//  LibraryTester
//
//  Created by Heonjin Ha on 2023/03/04.
//

import UIKit
import SnapKit
import SwiftEntryKit

class SwiftEntryKitViewController: UIViewController {

    let button: UIButton = {
        let btn = UIButton()
        return btn
    }()

    var contentView = UIView()

    var attributes: EKAttributes = {
        var attributes = EKAttributes.topFloat

        // Set its background to white
        attributes.entryBackground = .color(color: .white)

        // Animate in and out using default translation
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation

        return attributes
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setEntryKit()

    }

    // MARK: - Setup

    func setup() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap ME!", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }



    // MARK: - Set Actions
    @objc func buttonAction(_ sender: UIButton) {
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }

    func setEntryKit() {

        let title = EKProperty.LabelContent(text: "title", style: .init(font: .systemFont(ofSize: 18, weight: .bold), color: .black))
        let description = EKProperty.LabelContent(text: "description", style: .init(font: .systemFont(ofSize: 14, weight: .medium), color: .init(.gray)))
        let image = EKProperty.ImageContent(image: UIImage(named: "testImage")!, size: CGSize(width: 35, height: 35))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)

        self.contentView = EKNotificationMessageView(with: notificationMessage)
    }

}

