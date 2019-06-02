//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

class ImageDetailRouter: ImageDetailWireframe {

    static func assembleModule(_ image: Image) -> UIViewController {
        let view = ImageDetailViewController(nibName: nil, bundle: nil)
        let presenter = ImageDetailPresenter()

        view.presenter = presenter

        presenter.view = view
        presenter.image = image

        return view
    }
}
