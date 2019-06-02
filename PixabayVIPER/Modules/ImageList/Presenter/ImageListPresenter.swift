//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Foundation

class ImageListPresenter: ImageListPresentation {

    weak var view: ImageListView?
    var interactor: ImageListUseCase!
    var router: ImageListWireframe!

    var imageList: ImageList = ImageList(total: 0, totalHits: 0, hits: []) {
        didSet {
            view?.showImageList(imageList)
        }
    }

    func viewDidLoad() {
        // Do nothing
    }

    func didSelectImage(_ image: Image) {
        router.presentImageDetail(forImage: image)
    }

}


extension ImageListPresenter: ImageListInteractorOutput {

    func imageListFetched(_ imageList: ImageList) {
        self.imageList = imageList
    }

    func imageListFetchFailed(withError error: Error) {
        print(error)
    }

}
