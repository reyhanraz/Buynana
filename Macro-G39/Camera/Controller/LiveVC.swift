//
//  LiveVC.swift
//  Macro-G39
//
//  Created by Faris Ali Yafie on 01/12/20.
//

import UIKit
import AVKit
import AVFoundation
import Vision
import Photos

class LiveVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var liveView: UIView!
    @IBOutlet weak var toggleFlashButton: UIButton!
    
    let cameraController = CameraController()
    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var bananaType = ""
    var sendImage:UIImage = #imageLiteral(resourceName: "bananaKuning")
    var sendCIImg:CIImage?
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailPageVC{
            destination.delegate = self
            destination.image = sendImage
            destination.ciImg = sendCIImg
        }
        if segue.destination is HomeVC{
            self.navigationController?.popToRootViewController(animated: true)
        }
        if let dest = segue.destination as? RecipeVC{
            dest.bananaType = self.bananaType
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLiveCamera()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        captureSession.startRunning()
        self.navigationController?.navigationBar.isHidden = true
        super.viewDidAppear(animated)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: Action
    func setLiveCamera(){
        //Start the Camera
        captureSession.sessionPreset = .photo
    
        // get back camera as Video Capture Device
        guard let captureDevice = AVCaptureDevice.default(for: .video)
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        
        try? captureDevice.lockForConfiguration()
        captureDevice.activeVideoMinFrameDuration =  CMTimeMake(value: 1, timescale: 2)
        captureDevice.activeVideoMaxFrameDuration =  CMTimeMake(value: 1, timescale: 2)
            captureDevice.unlockForConfiguration()
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice)
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        captureSession.addInput(input)
        captureSession.startRunning()
        
        self.previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer?.frame.size = self.liveView.frame.size
        self.previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.liveView.layer.addSublayer(self.previewLayer!)
        self.previewLayer?.frame = view.frame
        
        //get access to video frames
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoQueue"))
        captureSession.addOutput(dataOutput)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        //print("Camera was able to capture a frame ", Date())
        
        guard let pixcelBuffer:CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        guard let model =  try? VNCoreMLModel(for: Pisang().model)
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            //check err
            //print(finishedReq.results)
        guard let results = finishedReq.results as? [VNClassificationObservation]
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        guard let firstObservation = results.first
            else { self.quickErr(myLine: #line,inputStr: "") ; return }
        var myMessage = ""
        var myConfident = 0
            myConfident = Int ( firstObservation.confidence * 100 )
        let myIdentifier = firstObservation.identifier.split(separator: ",")
        
        DispatchQueue.main.async {
        if (myConfident > 97 && myIdentifier[0] == "Banana") {
                myMessage = "I am \(myConfident) % confidence this object is : \(myIdentifier[0])."
                let toCIImage = CIImage(cvPixelBuffer: pixcelBuffer)
                let toUIImage = UIImage(ciImage: toCIImage)
                self.sendImage = toUIImage
                self.sendCIImg = toCIImage
                self.captureSession.stopRunning()
                self.toDetailPage()
        } else {
            myMessage = "I am not confidence to detect this object"
        }
            print(myMessage)
        }
        }
        
        // Anaylize image
        try? VNImageRequestHandler(cvPixelBuffer: pixcelBuffer, options: [:]).perform([request])
    }
    
    // pick image from photo library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.editedImage.rawValue)] as? UIImage {
            sendImage = pickedImage
        }
        picker.dismiss(animated: true, completion: self.toDetailPage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        captureSession.startRunning()
    }
    
    func quickErr(myLine: Int , inputStr : String = "" ) {
        print("===> Guard Error \(inputStr) :\n    file:\(#file)\n    line:\(myLine)\n    function:\(#function) ")
    }
    
    func toDetailPage(){
            self.performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton){    navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takeImage(_ sender: UIButton){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil) //captureSession.stopRunning
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
}

extension LiveVC: ModalHandler{
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
