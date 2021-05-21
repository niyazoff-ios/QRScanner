import UIKit
import AVFoundation

class MainViewController: UIViewController {

    var videoCapture = AVCaptureVideoPreviewLayer()
    let avSession = AVCaptureSession()
   
    
    private let qrScannerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start QR Scanner", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6148123741, green: 0.1017967239, blue: 0.1002308354, alpha: 1)
        button.addTarget(self, action: #selector(scanQR), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupQRButtonScan()
      //  setupVideoCapture()
    }
    
    @objc private func scanQR() {
        let menuVC = MenuViewController()
        navigationController?.pushViewController(menuVC, animated: true)
    //    startQRScanner()
    }
    
    private func setupVideoCapture() {
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            avSession.addInput(input)
        } catch {
            fatalError(error.localizedDescription)
        }
        
        let output = AVCaptureMetadataOutput()
        avSession.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        videoCapture = AVCaptureVideoPreviewLayer(session: avSession)
        videoCapture.frame = view.bounds
    }
    
    private func startQRScanner() {
        view.layer.addSublayer(videoCapture)
        avSession.startRunning()
    }
    
    private func setupQRButtonScan() {
        view.addSubview(qrScannerButton)
        NSLayoutConstraint.activate([
            qrScannerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrScannerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
extension MainViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard metadataObjects.count == 0 else { return }
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            if object.type == AVMetadataObject.ObjectType.qr {
                let menuVC = MenuViewController()
                navigationController?.pushViewController(menuVC, animated: true)
            }
        }
    }
}
