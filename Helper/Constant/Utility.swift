//
//  Utility.swift


//
//var hud:MBProgressHUD = MBProgressHUD()
//var isSavePressed : Bool = false
//var isSaveSlidehsowPressed : Bool = false
//var intSavedImageToAlbum : Int = 1
//var intGlobalSelectCount : Int = 0
//var navigationViewController : UINavigationController?

import UIKit
import Foundation
import Photos
import SystemConfiguration
import AVFoundation
import MBProgressHUD
import LGSideMenuController
var hud:MBProgressHUD = MBProgressHUD()
var isNoLoader = false
struct Utility{

//    /// MARK: - MBProgress Indicator Methods
    
    
    func showLoader(_ strMsg : String = "") {
        mainThread {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
            UIApplication.shared.keyWindow?.addSubview(hud)
            hud.mode = .indeterminate
            hud.dimBackground = true
            hud.labelText = strMsg
        }
    }
    
    func hideLoader() {
        mainThread {
            if UIApplication.shared.isNetworkActivityIndicatorVisible {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            hud.removeFromSuperview()
        }
    }
    
//    func showLoader() {
//        DispatchQueue.main.async {
//            UIApplication.shared.isNetworkActivityIndicatorVisible = true
//            hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
//            UIApplication.shared.keyWindow?.addSubview(hud)
//            hud.mode = .indeterminate
//        }
//    }
//
//    func hideLoader() {
//        DispatchQueue.main.async {
//            if UIApplication.shared.isNetworkActivityIndicatorVisible {
//                UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            }
//            hud.removeFromSuperview()
//        }
//    }
    
    //MARK: - Check Null or Nil Object
    
    func isObjectNotNil(object:AnyObject!) -> Bool
    {
        if let _:AnyObject = object
        {
            return true
        }
        
        return false
    }
    


}

//MARK: - DispatchQueue

func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

func mainThread(_ completion: @escaping () -> ()) {
    DispatchQueue.main.async {
        completion()
    }
}
//userInteractive
//userInitiated
//default
//utility
//background
//unspecified
func backgroundThread(_ qos: DispatchQoS.QoSClass = .background , completion: @escaping () -> ()) {
    DispatchQueue.global(qos:qos).async {
        completion()
    }
}
// MARK: - Platform

struct Platform {
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
}



// MARK: - Documents Directory Clear

func clearTempFolder() {
    let fileManager = FileManager.default
    let tempFolderPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    do {
        let filePaths = try fileManager.contentsOfDirectory(atPath: tempFolderPath)
        for filePath in filePaths {
            try fileManager.removeItem(atPath: tempFolderPath + "/" + filePath)
        }
    } catch {
        print("Could not clear temp folder: \(error)")
    }
}




// MARK: - Trim String

func trimString(string : NSString) -> NSString {
    return string.trimmingCharacters(in: NSCharacterSet.whitespaces) as NSString
}

// MARK: - Alert and Action Sheet Controller

func showAlertView(_ strAlertTitle : String, strAlertMessage : String) -> UIAlertController {
    let alert = UIAlertController(title: strAlertTitle, message: strAlertMessage, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (ACTION :UIAlertAction!)in
    }))
    return alert
}

// MARK:- Navigation

func viewController(withID ID : String) -> UIViewController {
    let controller = Constants.mainStoryboard.instantiateViewController(withIdentifier: ID)
    return controller
}

func viewController1(withID ID : String , storyBoard : String) -> UIViewController {
    let mainStoryboard = UIStoryboard(name: storyBoard, bundle: nil)
    let controller = mainStoryboard.instantiateViewController(withIdentifier: ID)
    return controller
}
// MARK:- UIButton Corner Radius

func cornerLeftButton(btn : UIButton) -> UIButton {
    
    let path = UIBezierPath(roundedRect:btn.bounds, byRoundingCorners:[.topLeft, .bottomLeft], cornerRadii: CGSize.init(width: 5, height: 5))
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    btn.layer.mask = maskLayer
    
    return btn
}

func cornerRightButton(btn : UIButton) -> UIButton {
    
    let path = UIBezierPath(roundedRect:btn.bounds, byRoundingCorners:[.topRight, .bottomRight], cornerRadii: CGSize.init(width: 5, height: 5))
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    btn.layer.mask = maskLayer
    
    return btn
}

// MARK:- UITextField Corner Radius

func cornerLeftTextField(textfield : UITextField) -> UITextField {
    
    let path = UIBezierPath(roundedRect:textfield.bounds, byRoundingCorners:[.topLeft, .bottomLeft], cornerRadii: CGSize.init(width: 2.5, height: 2.5))
    let maskLayer = CAShapeLayer()
    
    maskLayer.path = path.cgPath
    textfield.layer.mask = maskLayer
    
    return textfield
}

// MARK:- UserDefault Methods

func setUserDefault<T>(_ object : T  , key : String) {
    let defaults = UserDefaults.standard
    defaults.set(object, forKey: key)
    UserDefaults.standard.synchronize()
}
func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}
func getUserDefault(_ key: String) -> AnyObject? {
    let defaults = UserDefaults.standard
    
    if let name = defaults.value(forKey: key){
        return name as AnyObject?
    }
    return nil
}
func removeUserDefault(keyToRemove : String) -> AnyObject? {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey:keyToRemove)
    return nil
}


// MARK: - Image Upload WebService Methods

func generateBoundaryString() -> String{
    return "Boundary-\(UUID().uuidString)"
}

func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


// MARK: - Camera Permissions Methods

func checkCameraPermissionsGranted() -> Bool {
    var cameraPermissionStatus : Bool = false
    if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) ==  AVAuthorizationStatus.authorized {
        // Already Authorized
        cameraPermissionStatus = true
        return true
    } else {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted: Bool) -> Void in
            if granted == true {
                // User granted
                cameraPermissionStatus = granted
                print("Granted access to Camera");
            } else {
                // User rejected
                cameraPermissionStatus = granted
                print("Not granted access to Camera");
            }
        })
        return cameraPermissionStatus
    }
}

// MARK: - Photo Library Permissions Methods

func checkPhotoLibraryPermissionsGranted() -> Bool {
    var photoLibraryPermissionStatus : Bool = false
    let status = PHPhotoLibrary.authorizationStatus()
    if (status == PHAuthorizationStatus.authorized) {
        // Access has been granted.
        photoLibraryPermissionStatus = true
    }
    else if (status == PHAuthorizationStatus.denied) {
        // Access has been denied.
        photoLibraryPermissionStatus = false
    }
    else if (status == PHAuthorizationStatus.notDetermined) {
        // Access has not been determined.
        PHPhotoLibrary.requestAuthorization({ (newStatus) in
            if (newStatus == PHAuthorizationStatus.authorized) {
                photoLibraryPermissionStatus = true
            }
            else {
                photoLibraryPermissionStatus = false
            }
        })
    }
    else if (status == PHAuthorizationStatus.restricted) {
        // Restricted access - normally won't happen.
        photoLibraryPermissionStatus = false
    }
    return photoLibraryPermissionStatus
}

// MARK: - Set NavigationBar Methods

func setNavigationBar(viewController : UIViewController, strTitleName : String) {
    let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white]
    viewController.navigationController?.navigationBar.titleTextAttributes = (titleDict as! [NSAttributedStringKey : Any])
    
    viewController.navigationController?.navigationBar.tintColor = .white()
    
    viewController.navigationItem.title = strTitleName
    viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

    viewController.navigationController?.navigationBar.backgroundColor = UIColor.blue
}


func setNavigation(){
    UINavigationBar.appearance().barTintColor = .defaultBlue()
    UINavigationBar.appearance().tintColor = .white()
    //    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:Constants.RGBColorCodes.cNavigationBarColor]
    UINavigationBar.appearance().isTranslucent = false
    //    UIApplication.shared.statusBarView?.backgroundColor = Constants.RGBColorCodes.defaultBlueColor
    UINavigationBar.appearance().titleTextAttributes =
        [NSAttributedStringKey.foregroundColor: UIColor.white,
         NSAttributedStringKey.font: UIFont(name: Font.openSansRegular, size: 20)!]
}

// MARK: - Set TabBarController NavigationBar Methods

func setTabBarControllerNavigationBar(viewController : UIViewController, strTitleName : String) {
    
    let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white]
    viewController.tabBarController?.navigationController?.navigationBar.titleTextAttributes = titleDict as? [NSAttributedStringKey : Any]
    
    viewController.tabBarController?.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

    viewController.tabBarController?.navigationController?.navigationBar.tintColor = .white()
    viewController.tabBarController?.navigationItem.title = strTitleName
    viewController.tabBarController?.navigationController?.navigationBar.backgroundColor = .defaultBlue()
    viewController.tabBarController?.navigationController?.navigationBar.isTranslucent = false
 
}

// MARK:- Navigation
func navigateVC(identifierId : String) -> UIViewController {
    let controller = Constants.mainStoryboard.instantiateViewController(withIdentifier: identifierId)
    return controller
}

func saveData<T>(ObjectToSave : T  , KeyToSave : String)
{
    let data  = NSKeyedArchiver.archivedData(withRootObject: ObjectToSave)
    let defaults = UserDefaults.standard
    defaults.set(data, forKey:KeyToSave)
    UserDefaults.standard.synchronize()
}
protocol MyAlert {
    func takeAndChoosePhoto()
}

extension MyAlert where Self: UIViewController ,Self: UIImagePickerControllerDelegate , Self : UINavigationControllerDelegate {
    func alertPromptToAllowPhotoAccessViaSetting() {
        //let alert1 = UIAlertController(title: "Error", message:"Camera access required to...", preferredStyle: UIAlertControllerStyle.alert)
        let alert = UIAlertController(title: nil, message: "Photos access required", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(UIAlertAction(title: "Settings", style: .cancel) { (alert) -> Void in
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string:"App-Prefs:root=Privacy&path=PHOTOS")!, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(URL(string:"App-Prefs:root=Privacy&path=PHOTOS")!)
            }
        })
        present(alert, animated: true)
    }
    
    func alertPromptToAllowCameraAccessViaSetting() {
        //let alert1 = UIAlertController(title: "Error", message:"Camera access required to...", preferredStyle: UIAlertControllerStyle.alert)
        let alert = UIAlertController(title: nil, message: "Camera access required", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        alert.addAction(UIAlertAction(title: "Settings", style: .cancel) { (alert) -> Void in
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string:"App-Prefs:root=Privacy&path=CAMERA")!, options: [:], completionHandler: nil)
                DispatchQueue.main.async {
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
            else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(URL(string:"App-Prefs:root=Privacy&path=CAMERA")!)
                DispatchQueue.main.async {
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        })
        present(alert, animated: true)
    }
    
    func takeAndChoosePhoto(){
        DispatchQueue.main.async(execute: {() -> Void in
            //Code that presents or dismisses a view controller here
            
            //DispatchQueue.main.async(execute: {
            // work Needs to be done
            
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let button0 = UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction) -> Void in
                
                //  UIAlertController will automatically dismiss the view
            })
            let button1 = UIAlertAction(title: "Take photo", style: .default, handler: {(action: UIAlertAction) -> Void in
                if !UIImagePickerController.isSourceTypeAvailable(.camera) {
                    //                let alert = UIAlertView(title: "Error", message: "Device Has No Camera", delegate: self, cancelButtonTitle: "OK")
                    //alert.show()
                }
                else {
                    let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
                    switch authStatus {
                    case .authorized: let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .camera
                    imagePickerController.delegate = self
                    self.present(imagePickerController, animated: true, completion: {() -> Void in
                    })
                    case .denied: self.alertPromptToAllowCameraAccessViaSetting()
                        
                    default:
                        let imagePickerController = UIImagePickerController()
                        imagePickerController.sourceType = .camera
                        imagePickerController.delegate = self
                        self.present(imagePickerController, animated: true, completion: {() -> Void in
                        })
                    }
                }
            })
            let button2 = UIAlertAction(title: "Choose Existing", style: .default, handler: {(_ action: UIAlertAction) -> Void in
                //  The user tapped on "Choose existing"
                let status = PHPhotoLibrary.authorizationStatus()
                if (status == PHAuthorizationStatus.authorized) {
                    // Access has been granted.
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.sourceType = .photoLibrary
                    imagePickerController.delegate = self
                    self.present(imagePickerController, animated: true, completion: {() -> Void in
                    })
                }
                else if (status == PHAuthorizationStatus.denied) {
                    self.alertPromptToAllowPhotoAccessViaSetting()
                }
                else if (status == PHAuthorizationStatus.notDetermined) {
                    // Access has not been determined.
                    PHPhotoLibrary.requestAuthorization({ (newStatus) in
                        
                        if (newStatus == PHAuthorizationStatus.authorized) {
                            let imagePickerController = UIImagePickerController()
                            imagePickerController.sourceType = .photoLibrary
                            imagePickerController.delegate = self
                            
                            DispatchQueue.main.async(execute: {() -> Void in
                                //Code that presents or dismisses a view controller here
                                self.present(imagePickerController, animated: true, completion: nil)
                            })
                            //                        self.present(imagePickerController, animated: true, completion: {() -> Void in
                            //                        })
                            
                        }
                        else {
                            DispatchQueue.main.async {
                                _ = self.navigationController?.popViewController(animated: true)
                            }
                        }
                    })
                }
                else if (status == PHAuthorizationStatus.restricted) {
                    // Restricted access - normally won't happen.
                }
            })
            
            alertController.addAction(button0)
            alertController.addAction(button1)
            alertController.addAction(button2)
            
            if let popoverController = alertController.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            }
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
}
// MARK: - Button Navigation Bar

extension UIViewController {
    
    func pushVC(_ viewController : UIViewController){
        var isIN = false
        let navigationController = sideMenuController!.rootViewController as! UINavigationController
        for vc in (navigationController.viewControllers) {
            if type(of: vc) == type(of: viewController) {
                isIN = true
                navigationController.popToViewController(vc, animated: true)
                break
            }
        }
        if !isIN {
            
            navigationController.pushViewController(viewController, animated: false)
        }
    }
    func backButton(){
        let BackImage = UIButton(type: .custom)
        BackImage.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        BackImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        BackImage.addTarget(self, action: #selector(popVC), for: .touchUpInside)
        let item = UIBarButtonItem(customView: BackImage)
        self.navigationItem.leftBarButtonItem = item
    }
    @objc func popVC() {
        navigationController?.navigationBar.backItem?.title = ""
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    //MARK:- Side Menu Methods
    
    func setSlideMenuFirstTime(){
        let LeftVC = Constants.GlobalConstants.sideMenuStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoardID.kSidemenuID) as! SideMenuVC1
        let navigationController1 = UINavigationController(rootViewController: Constants.GlobalConstants.CategoryStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoardID.kCategoryVC1ID))
        let sideMenuController = LGSideMenuController(rootViewController: navigationController1,leftViewController: LeftVC,rightViewController: nil)
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            sideMenuController.leftViewWidth = Constants.ScreenSize.SCREEN_WIDTH - 150
        }
        else{
            sideMenuController.leftViewWidth = Constants.ScreenSize.SCREEN_WIDTH - 100
        }
        sideMenuController.isLeftViewSwipeGestureEnabled = true
        //sideMenuController.leftViewBackgroundImage = UIImage(named: "alphine")!
        sideMenuController.leftViewBackgroundColor = UIColor.themeMenu()
        sideMenuController.leftViewPresentationStyle = .scaleFromBig
        Constants.GlobalConstants.appDelegate.window?.rootViewController = sideMenuController

    }
    
    func setUpMenuButton() {
        let btnMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(openMenu))
        self.navigationItem.leftBarButtonItem = btnMenu
    }
    @objc func openMenu() {
        sideMenuController?.showLeftView(animated:true, completionHandler: {
            
        })
    }
    
    func setUpCartSearch() -> UIBarButtonItem {
        let btnCart = UIButton.init(type: .custom)
        btnCart.setImage(#imageLiteral(resourceName: "shop"), for: .normal)
        let lblCartCount = UILabel(frame: CGRect(x: btnCart.frame.origin.x + 17, y: btnCart.frame.origin.y - 4, width: 16, height: 16))
        lblCartCount.text = String(cartItemCount)
        lblCartCount.textColor = UIColor.white
        lblCartCount.backgroundColor = UIColor.defaultTheme()
        lblCartCount.font = UIFont (name: "Lato-Regular", size: 8)
        lblCartCount.cornerRadius = 8
        lblCartCount.clipsToBounds = true
        lblCartCount.textAlignment = .center
        btnCart.addSubview(lblCartCount)
        if cartItemCount == 0{
            lblCartCount.isHidden = true
        }
        else{
            lblCartCount.isHidden = false
        }
        btnCart.addTarget(self, action: #selector(openCart), for: .touchUpInside)
        let btnBarCart = UIBarButtonItem.init(customView: btnCart)
        let btnSearch = UIBarButtonItem(image: #imageLiteral(resourceName: "search"), style: .plain, target: self, action: #selector(btnSearchAct))
        self.navigationItem.rightBarButtonItems = [btnSearch,btnBarCart]
        return btnBarCart
    }
    func setUpCart() -> UIBarButtonItem {
        let btnCart = UIButton.init(type: .custom)
        btnCart.setImage(#imageLiteral(resourceName: "shop"), for: .normal)
        let lblCartCount = UILabel(frame: CGRect(x: btnCart.frame.origin.x + 17, y: btnCart.frame.origin.y - 4, width: 16, height: 16))
        lblCartCount.text = String(cartItemCount)
        lblCartCount.textColor = UIColor.white
        lblCartCount.backgroundColor = UIColor.defaultTheme()
        lblCartCount.font = UIFont (name: "Lato-Regular", size: 8)
        lblCartCount.cornerRadius = 8
        lblCartCount.clipsToBounds = true
        lblCartCount.textAlignment = .center
        btnCart.addSubview(lblCartCount)
        if cartItemCount == 0{
            lblCartCount.isHidden = true
        }
        else{
            lblCartCount.isHidden = false
        }
        btnCart.addTarget(self, action: #selector(openCart), for: .touchUpInside)
        let btnBarCart = UIBarButtonItem.init(customView: btnCart)
       
        self.navigationItem.rightBarButtonItem = btnBarCart
        return btnBarCart
    }
    @objc func openCart() {
        let controller = Constants.GlobalConstants.AddToCartStoryboard.instantiateViewController(withIdentifier: Constants.StoryBoardID.kAddToCartVC1ID)
        pushVC(controller)
        
        
//        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func btnSearchAct(){
        
        let controller = Constants.GlobalConstants.SearchStoryboard.instantiateViewController(withIdentifier:  Constants.StoryBoardID.kSearchVC1ID)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func setNavigationBar(strTitleName : String, isLeftAlign : Bool ) {
        
        if isLeftAlign {
            let lbNavTitle = UILabel (frame: CGRect(x: 0, y: 40, width: 320, height: 40))
            lbNavTitle.center = CGPoint(x: 160, y: 285)
            lbNavTitle.textAlignment = .left
            lbNavTitle.text = strTitleName
            lbNavTitle.textColor = UIColor.white
            self.navigationItem.titleView = lbNavTitle
        } else {
            let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.titleTextAttributes = (titleDict as! [NSAttributedStringKey : Any])
            self.navigationItem.title = strTitleName
        }
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.tabBarController?.navigationController?.navigationBar.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 0.0/255.0, green: 148.0/255.0, blue: 228.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    func navButtonWithImg(_ img : UIImage ,selector : Selector , isLeft : Bool) {
        let btn = UIButton(type: .system)
        btn.setImage(img, for: .normal)
        if Constants.DeviceType.IS_IPAD || Constants.DeviceType.IS_IPADMin || Constants.DeviceType.IS_IPADLarge{
            btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        }else{
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        }
        btn.addTarget(self, action: selector, for: .touchUpInside)
        let item = UIBarButtonItem(customView: btn)
        if (isLeft) {
            self.navigationItem.leftBarButtonItem  = item
        } else {
            self.navigationItem.rightBarButtonItem  = item
        }
        
    }
    func navRightButtonWithImg(_ img : UIImage ,selector : Selector , isRight : Bool) {
        let btn = UIButton(type: .system)
        btn.setImage(img, for: .normal)
        if Constants.DeviceType.IS_IPAD || Constants.DeviceType.IS_IPADMin || Constants.DeviceType.IS_IPADLarge{
            btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        }else{
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        }
        btn.addTarget(self, action: selector, for: .touchUpInside)
        let item = UIBarButtonItem(customView: btn)
        if (isRight) {
            self.navigationItem.rightBarButtonItem  = item
        } else {
            self.navigationItem.rightBarButtonItem  = item
        }
        
    }
    func setNavigationBar(strTitleName : String) {
        
        self.navigationItem.titleView = nil
        
        let titleDict: NSDictionary = [NSAttributedStringKey.foregroundColor: Constants.RGBColorCodes.whiteColor]
        self.navigationController?.navigationBar.titleTextAttributes = (titleDict as! [NSAttributedStringKey : Any])
        self.navigationItem.title = strTitleName
        
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.navigationBar.tintColor = Constants.RGBColorCodes.whiteColor
        self.navigationController?.navigationBar.backgroundColor = Constants.RGBColorCodes.defaultBlueColor
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
}
