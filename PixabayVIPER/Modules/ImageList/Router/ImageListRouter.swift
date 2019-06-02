//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

class ImageListRouter: ImageListWireframe {

    var viewController: UIViewController?

    func presentImageDetail(forImage image: Image) {
        let imageDetailModuleViewController = ImageDetailRouter.assembleModule(image)
        viewController?.navigationController?.pushViewController(imageDetailModuleViewController, animated: true)
    }

    static func assembleModule() -> UIViewController {
        let view = ImageListViewController(nibName: nil, bundle: nil)
        let presenter = ImageListPresenter()
        let interactor = ImageListInteractor()
        let router = ImageListRouter()

        let navigationViewController = UINavigationController(rootViewController: view)
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view

        return navigationViewController
    }


}
