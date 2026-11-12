import Flutter
import UIKit
import UserNotifications

/// Push notifications go straight through Apple (APNs). This delegate asks for
/// permission, hands the device token to Dart over the "camtrip/push" channel,
/// and reports which group a tapped notification belongs to.
@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var pushChannel: FlutterMethodChannel?
  private var deviceToken: String?
  private var pendingOpen: [String: Any]?
  private var tokenWaiters: [FlutterResult] = []

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    UNUserNotificationCenter.current().delegate = self
    if let remote = launchOptions?[.remoteNotification] as? [String: Any] {
      pendingOpen = remote
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "CamTripPush") else { return }
    let channel = FlutterMethodChannel(name: "camtrip/push", binaryMessenger: registrar.messenger())
    pushChannel = channel
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else { return }
      switch call.method {
      case "register":
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
          DispatchQueue.main.async {
            guard granted else { result(nil); return }
            if let token = self.deviceToken { result(token); return }
            self.tokenWaiters.append(result)
            UIApplication.shared.registerForRemoteNotifications()
          }
        }
      case "unregister":
        UIApplication.shared.unregisterForRemoteNotifications()
        self.deviceToken = nil
        result(nil)
      case "initialOpen":
        let open = self.pendingOpen
        self.pendingOpen = nil
        result(open?["groupId"] as? String)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken token: Data) {
    let hex = token.map { String(format: "%02x", $0) }.joined()
    deviceToken = hex
    tokenWaiters.forEach { $0(hex) }
    tokenWaiters.removeAll()
    pushChannel?.invokeMethod("token", arguments: hex)
  }

  override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    tokenWaiters.forEach { $0(nil) }
    tokenWaiters.removeAll()
  }

  // Show notifications while the app is open too.
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .sound, .list])
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    let info = response.notification.request.content.userInfo
    if let groupId = info["groupId"] as? String {
      if let channel = pushChannel {
        channel.invokeMethod("open", arguments: groupId)
      } else {
        pendingOpen = ["groupId": groupId]
      }
    }
    completionHandler()
  }
}
