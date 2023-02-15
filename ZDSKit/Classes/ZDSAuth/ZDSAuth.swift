import UIKit
import AVKit
import Photos
import MediaPlayer
import CoreLocation

//MARK: - 设备权限
public class ZDSAuth: NSObject {
   
    /// - Parameters:
    ///   - isRequest: 是否请求权限
    ///   - handler:   权限状态回调函数

    /// ** Privacy - Access to a File Provide Domain Usage Description **
    /// ** InfoKey - NSFileProviderDomainUsageDescription **
    public class func fileProviderDomainUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }

    /// ** Privacy - AppleEvents Sending Usage Description **
    /// ** InfoKey - NSAppleEventsUsageDescription **
    public class func appleEventsUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Bluetooth Always Usage Description **
    /// ** InfoKey - NSBluetoothAlwaysUsageDescription **
    public class func bluetoothAlwaysUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Bluetooth Peripheral Usage Description **
    /// ** InfoKey - NSBluetoothPeripheralUsageDescription **
    public class func bluetoothPeripheralUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Calendars Usage Description **
    /// ** InfoKey - NSCalendarsUsageDescription **
    public class func calendarsUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** 相机使用权限 **
    /// ** Privacy - Camera Usage Description **
    /// ** InfoKey - NSCameraUsageDescription **
    public class func cameraUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authorizationStatus {
        case .notDetermined:
            if isRequest {
                AVCaptureDevice.requestAccess(for: .video) { _ in
                    cameraUsage(completionHandler: handler)
                }
            } else {
                handler(authorizationStatus)
            }
        default:
            handler(authorizationStatus)
        }
    }
    
    /// ** Privacy - Contacts Usage Description **
    /// ** InfoKey - NSContactsUsageDescription **
    public class func contactsUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Desktop Folder Usage Description **
    /// ** InfoKey - NSDesktopFolderUsageDescription **
    public class func desktopFolderUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Documents Folder Usage Description **
    /// ** InfoKey - NSDocumentsFolderUsageDescription **
    public class func documentsFolderUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Downloads Folder Usage Description **
    /// ** InfoKey - NSDownloadsFolderUsageDescription **
    public class func downloadsFolderUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Driver Extension Usage Description **
    /// ** InfoKey - OSBundleUsageDescription **
    public class func osBundleUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Face ID Usage Description **
    /// ** InfoKey - NSFaceIDUsageDescription **
    public class func faceIDUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Fall Detection Usage Description **
    /// ** InfoKey - NSFallDetectionUsageDescription **
    public class func fallDetectionUsageDescription(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - File Provider Presence Usage Description **
    /// ** InfoKey - NSFileProviderPresenceUsageDescription **
    public class func fileProviderPresenceUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Focus Status Usage Description **
    /// ** InfoKey - NSFocusStatusUsageDescription **
    public class func focusStatusUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Health Records Usage Description **
    /// ** InfoKey - NSHealthClinicalHealthRecordsShareUsageDescription **
    public class func healthClinicalHealthRecordsShareUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Health Share Usage Description **
    /// ** InfoKey - NSHealthShareUsageDescription **
    public class func healthShareUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Health Update Usage Description **
    /// ** InfoKey - NSHealthUpdateUsageDescription **
    public class func healthUpdateUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - HomeKit Usage Description **
    /// ** InfoKey - NSHomeKitUsageDescription **
    public class func homeKitUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Local Network Usage Description **
    /// ** InfoKey - NSLocalNetworkUsageDescription **
    public class func localNetworkUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }

    /// ** Privacy - Location Default Accuracy Reduced
    /// ** InfoKey - NSLocationDefaultAccuracyReduced **
    public class func locationDefaultAccuracyReduced(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Location Temporary Usage Description Dictionary
    /// ** InfoKey - NSLocationTemporaryUsageDescriptionDictionary **
    public class func locationTemporaryUsageDescriptionDictionary(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Location Usage Description **
    /// ** InfoKey - NSLocationUsageDescription **
    public class func locationUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** 定位权限 仅限软件中使用 **
    /// ** Privacy - Location When In Use Usage Description **
    /// ** InfoKey - NSLocationWhenInUseUsageDescription **
    public class func locationWhenInUseUsage(isRequest: Bool = true, completionHandler handler: @escaping (CLAuthorizationStatus) -> Void) {
        if CLLocationManager.locationServicesEnabled() {
            var authorizationStatus: CLAuthorizationStatus = .notDetermined
            if #available(iOS 14.0, *) {
                authorizationStatus = ZDSLocationManager.default.locationManager.authorizationStatus
            } else {
                authorizationStatus = CLLocationManager.authorizationStatus()
            }
            switch authorizationStatus {
            case .notDetermined:
                if isRequest {
                    ZDSLocationManager.default.handler = handler
                    ZDSLocationManager.default.locationManager.requestWhenInUseAuthorization()
                } else {
                    handler(authorizationStatus)
                }
            default:
                handler(authorizationStatus)
            }
        } else {
            handler(.restricted)
        }
    }
    
    /// ** 定位权限 限软件中使用 和 长期使用 **
    /// ** Privacy - Location Always and When In Use Usage Description **
    /// ** InfoKey - NSLocationAlwaysAndWhenInUseUsageDescription **
    public class func locationAlwaysAndWhenInUseUsage(isRequest: Bool = true, completionHandler handler: @escaping (CLAuthorizationStatus) -> Void) {

    }
    
    /// ** 定位权限 长期使用 **
    /// ** Privacy - Location Always Usage Description **
    /// ** InfoKey - NSLocationAlwaysUsageDescription **
    public class func locationAlwaysUsage(isRequest: Bool = true, completionHandler handler: @escaping (CLAuthorizationStatus) -> Void) {
        if CLLocationManager.locationServicesEnabled() {
            var authorizationStatus: CLAuthorizationStatus = .notDetermined
            if #available(iOS 14.0, *) {
                authorizationStatus = ZDSLocationManager.default.locationManager.authorizationStatus
            } else {
                authorizationStatus = CLLocationManager.authorizationStatus()
            }
            switch authorizationStatus {
            case .notDetermined:
                if isRequest {
                    ZDSLocationManager.default.handler = handler
                    ZDSLocationManager.default.locationManager.requestAlwaysAuthorization()
                } else {
                    handler(authorizationStatus)
                }
            default:
                handler(authorizationStatus)
            }
        } else {
            handler(.restricted)
        }
    }
    
    /// ** 本地乐库权限 **
    /// ** Privacy - Media Library Usage Description **
    /// ** InfoKey - NSAppleMusicUsageDescription **
    @available(iOS 9.3, *)
    public class func mediaLibraryUsage(isRequest: Bool = true, completionHandler handler: @escaping (MPMediaLibraryAuthorizationStatus) -> Void) {
        let authorizationStatus = MPMediaLibrary.authorizationStatus()
        switch authorizationStatus {
        case .notDetermined:
            if isRequest {
                MPMediaLibrary.requestAuthorization { _ in
                    mediaLibraryUsage(completionHandler: handler)
                }
            } else {
                handler(authorizationStatus)
            }
        default:
            handler(authorizationStatus)
        }
    }
    
    /// ** 话筒使用权限 **
    /// ** Privacy - Microphone Usage Description **
    /// ** InfoKey - NSMicrophoneUsageDescription **
    public class func microphoneUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .audio)
        switch authorizationStatus {
        case .notDetermined:
            if isRequest {
                AVCaptureDevice.requestAccess(for: .audio) { _ in
                    microphoneUsage(completionHandler: handler)
                }
            } else {
                handler(authorizationStatus)
            }
        default:
            handler(authorizationStatus)
        }
    }
    
    /// ** Privacy - Motion Usage Description **
    /// ** InfoKey - NSMotionUsageDescription **
    public class func motionUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Music Usage Description **
    /// ** InfoKey - kTCCServiceMediaLibrary **
    public class func musicUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Nearby Interaction Usage Description **
    /// ** InfoKey - NSNearbyInteractionUsageDescription **
    public class func nearbyInteractionUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Network Volumes Usage Description **
    /// ** InfoKey - NSNetworkVolumesUsageDescription **
    public class func networkVolumesUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - NFC Scan Usage Description **
    /// ** InfoKey - NFCReaderUsageDescription **
    public class func NFCReaderUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** 相册写入权限 **
    /// ** Privacy - Photo Library Additions Usage Description **
    /// ** InfoKey - NSPhotoLibraryAddUsageDescription **
    public class func photoLibraryAddUsage(isRequest: Bool = true, completionHandler handler: @escaping (PHAuthorizationStatus) -> Void) {
        if #available(iOS 14, *) {
            let authorizationStatus = PHPhotoLibrary.authorizationStatus(for: .addOnly)
            switch authorizationStatus {
            case .notDetermined:
                if isRequest {
                    PHPhotoLibrary.requestAuthorization(for: .readWrite) { _ in
                        photoLibraryAddUsage(completionHandler: handler)
                    }
                } else {
                    handler(authorizationStatus)
                }
            default:
                handler(authorizationStatus)
            }
        } else {
            let authorizationStatus = PHPhotoLibrary.authorizationStatus()
            switch authorizationStatus {
            case .notDetermined:
                if isRequest {
                    PHPhotoLibrary.requestAuthorization { _ in
                        photoLibraryAddUsage(completionHandler: handler)
                    }
                } else {
                    handler(authorizationStatus)
                }
            default:
                handler(authorizationStatus)
            }
        }
    }
    
    /// ** 相册读写权限 **
    /// ** Privacy - Photo Library Usage Description **
    /// ** InfoKey - NSPhotoLibraryUsageDescription **
    public class func photoLibraryUsage(isRequest: Bool = true, completionHandler handler: @escaping (PHAuthorizationStatus) -> Void) {
        if #available(iOS 14, *) {
            let authorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
            switch authorizationStatus {
            case .notDetermined:
                if isRequest {
                    PHPhotoLibrary.requestAuthorization(for: .readWrite) { _ in
                        photoLibraryUsage(completionHandler: handler)
                    }
                } else {
                    handler(authorizationStatus)
                }
            default:
                handler(authorizationStatus)
            }
        } else {
            let authorizationStatus = PHPhotoLibrary.authorizationStatus()
            switch authorizationStatus {
            case .notDetermined:
                if isRequest {
                    PHPhotoLibrary.requestAuthorization { _ in
                        photoLibraryUsage(completionHandler: handler)
                    }
                } else {
                    handler(authorizationStatus)
                }
            default:
                handler(authorizationStatus)
            }
        }
    }
    
    /// ** Privacy - Reminders Usage Description **
    /// ** InfoKey - NSRemindersUsageDescription **
    public class func remindersUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Removable Volumes Usage Description **
    /// ** InfoKey - NSRemovableVolumesUsageDescription **
    public class func removableVolumesUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Siri Usage Description **
    /// ** InfoKey - NSSiriUsageDescription **
    public class func siriUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Speech Recognition Usage Description **
    /// ** InfoKey - NSSpeechRecognitionUsageDescription **
    public class func speechRecognitionUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - System Administration Usage Description **
    /// ** InfoKey - NSSystemAdministrationUsageDescription **
    public class func systemAdministrationUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - System Extension Usage Description **
    /// ** InfoKey - NSSystemExtensionUsageDescription **
    public class func systemExtensionUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - Tracking Usage Description **
    /// ** InfoKey - NSUserTrackingUsageDescription **
    public class func userTrackingUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }
    
    /// ** Privacy - TV Provider Usage Description **
    /// ** InfoKey - NSVideoSubscriberAccountUsageDescription **
    public class func videoSubscriberAccountUsage(isRequest: Bool = true, completionHandler handler: @escaping (AVAuthorizationStatus) -> Void) {

    }

}

//MARK: - 定位管理
public class ZDSLocationManager: NSObject {

    public static let `default` = ZDSLocationManager()

    public let locationManager = CLLocationManager()

    public var handler:((_ authorizationStatus: CLAuthorizationStatus) -> ())? {
        didSet {
            locationManager.delegate = self
        }
    }
}

extension ZDSLocationManager: CLLocationManagerDelegate {

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard let handler = ZDSLocationManager.default.handler else { return }
        handler(status)
    }

    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let handler = ZDSLocationManager.default.handler else { return }
        if #available(iOS 14.0, *) { handler(manager.authorizationStatus) }
    }
}
