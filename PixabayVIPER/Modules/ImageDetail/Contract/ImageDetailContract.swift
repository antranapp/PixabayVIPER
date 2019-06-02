//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

protocol ImageDetailView: class {
    var presenter: ImageDetailPresentation! { get set }

    func show(image: Image)
}

protocol ImageDetailPresentation: class {
    var view: ImageDetailView? { get set }

    func viewDidLoad()
}

protocol ImageDetailWireframe: class {
    static func assembleModule(_ image: Image) -> UIViewController
}
