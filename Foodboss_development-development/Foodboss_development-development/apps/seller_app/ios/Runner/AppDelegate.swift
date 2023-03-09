import UIKit
import Flutter
import GoogleMaps
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAghIOtgA6JfK6Yo7rrKFGeKahA9F-ls58")
      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
    Messaging.messaging().apnsToken = deviceToken
    super.application(
      application,
      didRegisterForRemoteNotificationsWithDeviceToken : deviceToken
    )
//   if #available(iOS 14.2, *) {
 
//   UNUserNotificationCenter.current().delegate = self

//   let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//   UNUserNotificationCenter.current().requestAuthorization(
//     options: authOptions,
//     completionHandler: { _, _ in }
//   )
// } else {
//   let settings: UIUserNotificationSettings =
//     UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//   application.registerUserNotificationSettings(settings)
// }

// application.registerForRemoteNotifications()
  }
}
