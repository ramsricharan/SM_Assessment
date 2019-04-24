//
//  GetWebImages.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/23/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation

class GetWebImages {
    
    
    private static let keyword = "cars"
    
    private init() {}
    
    
    // Downloads image data from unsplash.com API
    public static func downloadImages(completionHandler: @escaping (_ results :[ImageDetails]) -> Void) {
        let searchURL = BASE_URL + SEARCH_ENDPOINT + SEARCH_PARAMETERS + keyword

        if let url = URL(string: searchURL) {
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue(ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let data = data {
                    do {
                        let imageData = try JSONDecoder().decode(WebImagesModal.self, from: data)
                        let res = getFormattedData(decodedJSON: imageData)
                        completionHandler(res)
                    } catch {
                        print("JSON decoding failed!!")
                    }
                }
                }.resume()
        }
    }
}

// Create a populates well organised list with ImageDetails
private func getFormattedData(decodedJSON : WebImagesModal) -> [ImageDetails] {
    var imageData = [ImageDetails]()
    
    guard let results = decodedJSON.results else { return [] }
    
    for result in results {
        let published = result.published_at ?? ""
        let collectorName = result.user?.name ?? ""
        
        if let photos = result.preview_photos {
            for photo in photos {
                let small = photo.urls?.small
                let full = photo.urls?.full
                let imageURLs = url(full: full, small: small)
                
                let detail = ImageDetails(published: published, collectedBy: collectorName, urls: imageURLs)
                imageData.append(detail)
            }
        }
    }
    return imageData
}
