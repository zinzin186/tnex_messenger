//
//  MXURL.swift
//  Tnex messenger
//
//  Created by Din Vu Dinh on 28/02/2022.
//

import Foundation
import MatrixSDK

struct MXURL {
    var mxContentURI: URL

    init?(mxContentURI: String) {
        guard let uri = URL(string: mxContentURI) else {
            return nil
        }
        self.mxContentURI = uri
    }

    func contentURL(on homeserver: URL) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = homeserver.host
        guard let contentHost = mxContentURI.host else { return nil }
        components.path = "/_matrix/media/r0/download/\(contentHost)/\(mxContentURI.lastPathComponent)"
        return components.url
    }
}

extension MXURL {
    static var nioIconURL: URL {
        Self.nioIcon.contentURL(on: URL(string: "https://matrix.org")!)!
    }

    static var nioIcon: MXURL {
        MXURL(mxContentURI: "mxc://matrix.org/rdElwkPTTrdZljUuKwkSEMqV")!
    }
}
