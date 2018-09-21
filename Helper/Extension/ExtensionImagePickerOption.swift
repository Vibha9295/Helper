//
//  ExtensionImagePickerOption.swift
//  RoundTheTable
//
//  Created by nirzar on 29/05/18.
//  Copyright © 2018 Zaptech. All rights reserved.
//

import UIKit
import Photos
protocol ChoosePicture {
    func takeAndChoosePhoto(isVideo : Bool)
}

extension ChoosePicture where Self: UIViewController ,Self: UIImagePickerControllerDelegate , Self : UINavigationControllerDelegate {
    func alertPromptToAllowPhotoAccessViaSetting() {
        
        let alert = UIAlertController(title: nil, message: Constants.AlertMessage.msgPhotoLibraryPermission, preferredStyle: .alert)
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
        let alert = UIAlertController(title: nil, message: Constants.AlertMessage.msgCameraPermission, preferredStyle: .alert)
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
    
    func takeAndChoosePhoto(isVideo : Bool){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let btnCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction) -> Void in
            //  UIAlertController will automatically dismiss the view
        })
        let btnTakePhoto = UIAlertAction(title: "Take Photo", style: .default, handler: {(action: UIAlertAction) -> Void in
            if !UIImagePickerController.isSourceTypeAvailable(.camera) {
                //self.view.makeToast(AlertMessage.msgNoCamera)
                
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
        let btnChooseExisting = UIAlertAction(title: "Choose Photo", style: .default, handler: {(_ action: UIAlertAction) -> Void in
            //  The user tapped on "Choose existing"
            let status = PHPhotoLibrary.authorizationStatus()
            
            if (status == PHAuthorizationStatus.authorized) {
                // Access has been granted.
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                if isVideo == true{
                    imagePickerController.mediaTypes = ["public.image", "public.movie"]
                }
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
                        if isVideo == true{
                            imagePickerController.mediaTypes = ["public.image", "public.movie"]
                        }
                        imagePickerController.delegate = self
                        DispatchQueue.main.async {
                            self.present(imagePickerController, animated: true, completion: {() -> Void in
                            })
                        }
                        
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
        
        
        alert.addAction(btnCancel)
        alert.addAction(btnTakePhoto)
        alert.addAction(btnChooseExisting)
        
        //alert.view.tintColor = UIColor.black
        present(alert, animated: true)
        //present(alert, animated: true, completion: nil)
    }
    
}
