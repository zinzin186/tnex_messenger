/*
 The MIT License (MIT)

 Copyright (c) 2015-present Badoo Trading Limited.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

import Foundation
import UIKit


class TnexMediaItem: MediaItem {
    var urlString: String?
    var image: UIImage?
    var displaySize: CGSize
    var imageSize: CGSize
    var id: String?
    
    init(imageSize: CGSize, image: UIImage? = nil, urlString: String?) {
       self.displaySize = imageSize
       self.imageSize = imageSize
        self.image = image
        self.urlString = urlString
   }
    
    
}

class DemoPhotoMessageViewModel: PhotoMessageViewModel<DemoPhotoMessageModel> {

    override init(photoMessage: DemoPhotoMessageModel, messageViewModel: MessageViewModelProtocol) {
        super.init(photoMessage: photoMessage, messageViewModel: messageViewModel)
        if photoMessage.isIncoming {
            self.image.value = nil
        }
    }

    override func willBeShown() {
//        self.fakeProgress()
    }

    func fakeProgress() {
        if [TransferStatus.success, TransferStatus.failed].contains(self.transferStatus.value) {
            return
        }
        if self.transferProgress.value >= 1.0 {
            if arc4random_uniform(100) % 2 == 0 {
                self.transferStatus.value = .success
//                self.image.value = self.fakeImage
            } else {
                self.transferStatus.value = .failed
            }

            return
        }
        self.transferStatus.value = .transfering
        let delaySeconds: Double = Double(arc4random_uniform(600)) / 1000.0
        let delayTime = DispatchTime.now() + Double(Int64(delaySeconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) { [weak self] in
            guard let sSelf = self else { return }
            let deltaProgress = Double(arc4random_uniform(15)) / 100.0
            sSelf.transferProgress.value = min(sSelf.transferProgress.value + deltaProgress, 1)
            sSelf.fakeProgress()
        }
    }
}

class DemoPhotoMessageViewModelBuilder: ViewModelBuilderProtocol {

    let messageViewModelBuilder = MessageViewModelDefaultBuilder()

    func createViewModel(_ model: DemoPhotoMessageModel) -> DemoPhotoMessageViewModel {
        let messageViewModel = self.messageViewModelBuilder.createMessageViewModel(model)
        let photoMessageViewModel = DemoPhotoMessageViewModel(photoMessage: model, messageViewModel: messageViewModel)
        photoMessageViewModel.avatarImage.value = UIImage(named: "userAvatar")
        return photoMessageViewModel
    }

    func canCreateViewModel(fromModel model: Any) -> Bool {
        return model is DemoPhotoMessageModel
    }
}
