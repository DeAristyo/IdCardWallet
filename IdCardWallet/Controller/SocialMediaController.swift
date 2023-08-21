//
//  SocialMediaController.swift
//  IdCardWallet
//
//  Created by Billbert Pohandy on 26/07/23.
//

import UIKit

class SocialMediaController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let socialMediaPlatforms = ["LinkedIn", "Instagram", "Twitter"]
        var selectedPlatforms: Set<String> = []

        @IBOutlet weak var tableView: UITableView!
    weak var delegate: SocialMediaDelegate?

    // Call this method when the user selects a social media from the list
      func didSelectSocialMedia(_ socialMedia: String) {
          delegate?.didSelectSocialMedia(socialMedia)
          navigationController?.popViewController(animated: true)
      }

    override func viewDidLoad() {
        super.viewDidLoad()

        let titleAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
            ]
            self.navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes

        let buttonAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)
            ]
            UIBarButtonItem.appearance().setTitleTextAttributes(buttonAttributes, for: .normal)

        let cancelItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        cancelItem.setTitleTextAttributes(
            [.foregroundColor: UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)],
            for: .normal
        )

        let addItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        addItem.setTitleTextAttributes(
            [.foregroundColor: UIColor(red: 0.035, green: 0.173, blue: 0.298, alpha: 1)]
            , for: .normal
        )

        self.navigationItem.leftBarButtonItem = cancelItem
        self.navigationItem.rightBarButtonItem = addItem
        self.navigationItem.title = "Add Social Media"
        self.navigationController?.navigationBar.prefersLargeTitles = true

        tableView.dataSource = self
               tableView.delegate = self
               tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return socialMediaPlatforms.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let platform = socialMediaPlatforms[indexPath.row]
            cell.textLabel?.text = platform

            // Check if the platform is selected, and set the accessory type accordingly
            if selectedPlatforms.contains(platform) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }

            return cell
        }

        // Implement UITableViewDelegate method to handle cell selection
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let platform = socialMediaPlatforms[indexPath.row]

            // Toggle the selection status
            if selectedPlatforms.contains(platform) {
                selectedPlatforms.remove(platform)
            } else {
                selectedPlatforms.insert(platform)
            }

            // Reload the table view to update the checkmark
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }

    @objc func cancelTapped() {
           dismiss(animated: true, completion: nil)
       }

    @objc func addTapped() {
        if let selectedPlatform = selectedPlatforms.first {
            didSelectSocialMedia(selectedPlatform)
        }
        dismiss(animated: true, completion: nil)
    }

}
// SocialMediaDelegate.swift
protocol SocialMediaDelegate: AnyObject {
    func didSelectSocialMedia(_ socialMedia: String)
}
