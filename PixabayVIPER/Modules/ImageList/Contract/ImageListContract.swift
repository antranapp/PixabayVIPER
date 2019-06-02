//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

protocol ImageListView: UIViewController {
    var presenter: ImageListPresentation! { get set }

    func showImageList(_ imageList: ImageList)
}

protocol ImageListPresentation: class {
    var view: ImageListView? { get set }
    var interactor: ImageListUseCase! { get set }
    var router: ImageListWireframe! { get set }

    func viewDidLoad()
    func didSelectImage(_ image: Image)
}

protocol ImageListUseCase: class {
    var output: ImageListInteractorOutput! { get set }

    func fetchImageList(withSearchTerm term: String)
}

protocol ImageListInteractorOutput: class {

    func imageListFetched(_ imageList: ImageList)
    func imageListFetchFailed(withError error: Error)
}

protocol ImageListWireframe: class {
    var viewController: UIViewController? { get set }

    func presentImageDetail(forImage image: Image)

    static func assembleModule() -> UIViewController
}
