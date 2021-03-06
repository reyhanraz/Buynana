//
//  ViewController.swift
//  Macro-G39
//
//  Created by Reyhan Rifqi on 05/10/20.
//  Modified by Faris Ali on 02/10/20.
//

import UIKit
import Photos
import Vision

class MainController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    public var timer = Timer()
    public var sendImage:UIImage = #imageLiteral(resourceName: "bananaKuning")
    var bananaType = ""
    
    @IBOutlet weak var detectorView: UIImageView!
    
    @IBOutlet fileprivate var captureButton: UIButton!
    
    ///Displays a preview of the video output generated by the device's cameras.
    @IBOutlet fileprivate var capturePreviewView: UIView!
    
    ///Allows the user to put the camera in photo mode.
    @IBOutlet fileprivate var toggleCameraButton: UIButton!
    @IBOutlet fileprivate var toggleFlashButton: UIButton!
    @IBOutlet fileprivate var backButton: UIButton!
    
    let cameraController = CameraController()
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPageVC{
            destination.delegate = self
            destination.image = sendImage
        }
        if segue.destination is HomeVC{
            self.navigationController?.popToRootViewController(animated: true)
        }
        if let dest = segue.destination as? RecipeVC{
            dest.bananaType = self.bananaType
        }
    }
}

extension MainController {
    override func viewDidLoad() {
        configureCameraController()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.liveDetector), userInfo: nil, repeats: true)
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        timer.invalidate()
//    }
}

extension MainController {
    func configureCameraController() {
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            try? self.cameraController.displayPreview(on: self.capturePreviewView)
        }
    }
    
    @objc func liveDetector(){
        cameraController.liveImage {(image, error) in
            guard let image = image else {
                print(error ?? "Image capture error")
                return
            }
            
            // START: detection camera image
            guard let model = try? VNCoreMLModel(for: Pisang().model) else {
                fatalError("Failed to load model")
            }
            
            // Create a vision request
            let request = VNCoreMLRequest(model: model) {[weak self] request, error in
                guard let results = request.results as? [VNClassificationObservation],
                    let topResult = results.first
                    else {
                        fatalError("Unexpected results")
                }
//                print("\(Int(topResult.confidence * 100))% \(topResult.identifier)")
                var messageDetector = ""
                var confidentLevel = 0
                let identifierObject = topResult.identifier.split(separator: ",")
                confidentLevel = Int(topResult.confidence * 100)
                messageDetector = "Ini adalah \(confidentLevel)% \(identifierObject[0])"
                print(messageDetector)
                confidentLevel = Int ( topResult.confidence * 100 )
                    if (identifierObject[0] == "Banana") {
                        
                        
                        if (confidentLevel >= 90) {
                            self?.captureButton.isEnabled = true
                            self!.detectorView.image = #imageLiteral(resourceName: "GroupG")
                        }else{
                            self?.captureButton.isEnabled = false
                            self!.detectorView.image = #imageLiteral(resourceName: "GroupR")
                        }
                    } else {
                        messageDetector = "Ini bukan pisang"
                        self?.captureButton.isEnabled = false
                        self!.detectorView.image = nil
                    }
                    
                    print("\(messageDetector)")
            }
            
            guard let ciImage = CIImage(image: image)
                else { fatalError("Cant create CIImage from UIImage") }
            
            // Run klasifikasi jenis pisang
            let handler = VNImageRequestHandler(ciImage: ciImage)
                do {
                    try handler.perform([request])
                } catch {
                    print(error)
                }
            // END: detection camera image
        }
    }
    
    func toDetailPage(){
            self.performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    @IBAction func backButtonTapped(_ sender: UIButton){    navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func toggleFlash(_ sender: UIButton) {
        if cameraController.flashMode == .on {
            cameraController.flashMode = .off
            toggleFlashButton.setImage(#imageLiteral(resourceName: "blitz-icon"), for: .normal)
            toggleFlashButton.contentMode = .scaleToFill
        }
            
        else {
            cameraController.flashMode = .on
            toggleFlashButton.setImage(#imageLiteral(resourceName: "flash"), for: .normal)
            toggleFlashButton.contentMode = .scaleToFill
        }
    }
    
    @IBAction func switchCameras(_ sender: UIButton) {
        do {
            try cameraController.switchCameras()
        }
            
        catch {
            print(error)
        }
        
        switch cameraController.currentCameraPosition {
        case .some(.front):
            toggleCameraButton.setImage(#imageLiteral(resourceName: "flipCamera-icon"), for: .normal)
            
        case .some(.rear):
            toggleCameraButton.setImage(#imageLiteral(resourceName: "flipCamera-icon"), for: .normal)
            
        case .none:
            return
        }
    }
    
    @IBAction func takeImage(_ sender: UIButton){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.editedImage.rawValue)] as? UIImage {
            sendImage = pickedImage
        }
        picker.dismiss(animated: true, completion: self.toDetailPage)
    
    }
    
    @IBAction func captureImage(_ sender: UIButton) {
        timer.invalidate()
        if (timer.isValid == false)  {
            cameraController.captureImage {(image, error) in
                guard let image = image else {
                    print(error ?? "Image capture error")
                    return
                }
            self.sendImage = image
            self.toDetailPage()
//            try? PHPhotoLibrary.shared().performChangesAndWait {
//                PHAssetChangeRequest.creationRequestForAsset(from: image)
//
//            }
            }
        }
        
    }
    
}
extension MainController: ModalHandler{
    func modalDismissed(bananaType: String) {
        self.bananaType = bananaType
        performSegue(withIdentifier: "toRecipe", sender: self)
//        let storyB = UIStoryboard(name: "RecipeSB", bundle: nil)
//        let vc = storyB.instantiateViewController(withIdentifier: "RecipeVC") as! RecipeVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
protocol ModalHandler: AnyObject {
    func modalDismissed(bananaType: String)
}
