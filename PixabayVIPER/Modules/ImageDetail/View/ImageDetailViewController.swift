//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {

    // MARK: Properties

    // Public

    @IBOutlet weak var imageView: UIImageView!

    var presenter: ImageDetailPresentation!

    // Private

    private var image: Image? {
        didSet {
            guard let image = image else { return }
            guard let url = URL(string: image.largeImageURL) else { return }

            imageView.kf.setImage(with: url)
        }
    }

    // MARK: Lifecyles

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"

        presenter.viewDidLoad()
    }
}

extension ImageDetailViewController: ImageDetailView {

    func show(image: Image) {
        self.image = image
    }
}
