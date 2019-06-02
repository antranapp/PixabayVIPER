//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Foundation

class ImageListInteractor: ImageListUseCase {

    weak var output: ImageListInteractorOutput!

    func fetchImageList(withSearchTerm searchTerm: String) {
        let urlString = "https://pixabay.com/api/?key=107764-f19c20d5ca4d545d9b0a09de3&q=\(searchTerm)&image_type=photo&pretty=true"
        let url = URL(string: urlString)!

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil else {
                self.output.imageListFetchFailed(withError: error!)
                return
            }

            guard let data = data else {
                self.output.imageListFetchFailed(withError: ServiceError.noData)
                return
            }

            do {
                let decoder = JSONDecoder()
                let imageData = try decoder.decode(ImageList.self, from: data)
                self.output.imageListFetched(imageData)
            } catch {
                self.output.imageListFetchFailed(withError: error)
            }
        }.resume()
    }
}

enum ServiceError: Error {
    case noData
}
