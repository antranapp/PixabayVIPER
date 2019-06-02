//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Foundation

class ImageDetailPresenter: ImageDetailPresentation {

    var view: ImageDetailView?
    var router: ImageDetailWireframe!
    var image: Image!

    func viewDidLoad() {
        view?.show(image: image)
    }

}
