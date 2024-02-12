//
//  UIImageView+Extension.swift
//
//
//  Created by Akihiro Matsuyama on 2024/02/13.
//

import UIKit

extension UIImageView {
    /// URLから画像を非同期に読み込む
    /// - Parameters:
    ///   - url: 画像のURL
    ///   - completion: 画像の読み込み完了後に実行されるオプショナルなクロージャ。成功した場合はUIImageを、失敗した場合はErrorを受け取る。
    public func loadImage(from url: URL, completion: ((Result<UIImage, Error>) -> Void)? = nil) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                let error = NSError(domain: "imageLoadError", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data loading or Image initialization failed"])
                DispatchQueue.main.async {
                    completion?(.failure(error))
                }
                return
            }

            DispatchQueue.main.async {
                self.image = image
                completion?(.success(image))
            }
        }.resume()
    }
}
