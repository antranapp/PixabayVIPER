//
//  Copyright © 2019 An Tran. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    func presentImageListScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = ImageListRouter.assembleModule()
    }
}
