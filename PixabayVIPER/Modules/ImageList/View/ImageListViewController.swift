//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Kingfisher
import UIKit

class ImageListViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties

    // Public

    @IBOutlet weak var searchTermTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    var presenter: ImageListPresentation!

    // Private

    private var activityIndicator: UIActivityIndicatorView!
    private var images: [Image] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        searchTermTextField.delegate = self

        activityIndicator = UIActivityIndicatorView(style: .gray)
        let rightButton = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItem = rightButton

        tableView.register(UINib(nibName: "ImageListTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageListTableViewCell")

        title = "List"
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }

        presenter.interactor.fetchImageList(withSearchTerm: text)

        textField.resignFirstResponder()
        return true
    }
}

extension ImageListViewController: ImageListView {

    func showImageList(_ imageList: ImageList) {
        images = imageList.hits
    }

}

extension ImageListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
}

extension ImageListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ImageListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ImageListTableViewCell") as! ImageListTableViewCell

        let image = images[indexPath.row]
        cell.titleLabel?.text = image.previewURL
        guard let url = URL(string: image.previewURL) else {
            return cell
        }

        cell.previewImageView.kf.setImage(with: url)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        presenter.didSelectImage(image)
    }
}
