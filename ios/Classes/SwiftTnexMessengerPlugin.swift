import Flutter
import UIKit
import MatrixSDK

public class SwiftTnexMessengerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "tnex_messenger", binaryMessenger: registrar.messenger())
    let instance = SwiftTnexMessengerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    gotoChatDetail()
    result("iOS " + UIDevice.current.systemVersion)
  }

  private func gotoChatDetail() {
          APIManager.shared
          let currentVC = UIViewController.visibleViewController()
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
          let gotoAction = UIAlertAction(title: "Goto", style: .default, handler: {[weak self] _ in
              self?.gotoViewController()
          })
          let alertVC = UIAlertController.init(title: "title", message: "Oke", preferredStyle: .alert)
          alertVC.addAction(cancelAction)
          alertVC.addAction(gotoAction)
          currentVC?.present(alertVC, animated: true, completion: nil)
      }

        private func gotoViewController() {
            APIManager.shared.loginToken {[weak self] isSuccess in
                        if isSuccess {
                            guard let rooms = APIManager.shared.getRooms() else { return }
                            let vc = ConversationViewController(rooms: rooms)
                                        let navi = UINavigationController(rootViewController: vc)
                                        navi.modalPresentationStyle = .fullScreen
                                        UIViewController.visibleViewController()?.present(navi, animated: true, completion: nil)
                        }
                    }

        }
}
