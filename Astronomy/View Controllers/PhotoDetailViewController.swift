//
//  PhotoDetailViewController.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/9/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func save(_ sender: Any) {
        guard let image = imageView.image else { return }
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                self.presentFailedSaveAlert()
                return
            }
            
            PHPhotoLibrary.shared().performChanges({
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            }, completionHandler: { (success, error) in
                if let error = error {
                    NSLog("Error saving photo: \(error)")
                    return
                }
                DispatchQueue.main.async {
                    self.presentSuccessfulSaveAlert()
                }
            })
        }
    }
    
    func presentFailedSaveAlert() {
        let alert = UIAlertController(title: "Unable to save photo", message: "Please grant Photo Library permissions to save photos!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func presentSuccessfulSaveAlert() {
        let alert = UIAlertController(title: "Photo Saved!", message: "The photo has been saved to your Photo Library!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        alert.addAction(okayAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func updateViews() {
        guard let photo = photo, isViewLoaded else { return }
        do {
            let data = try Data(contentsOf: photo.imageURL.usingHTTPS!)
            imageView.image = UIImage(data: data)?.filtered()
            let dateString = dateFormatter.string(from: photo.earthDate)
            detailLabel.text = "Taken by \(photo.camera.roverId) on \(dateString) (Sol \(photo.sol))"
            cameraLabel.text = photo.camera.fullName
        } catch {
            NSLog("Error setting up views on detail view controller: \(error)")
        }
    }
    
    // MARK: - Properties
    
    var photo: MarsPhotoReference? {
        didSet {
            updateViews()
        }
    }
    
    lazy var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .short
        df.timeStyle = .short
        return df
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var cameraLabel: UILabel!
    
    // MARK: - State Restoration
    
    override func encodeRestorableState(with coder: NSCoder) {
        defer { super.encodeRestorableState(with: coder)}
        
        var photoData: Data?
        
        do {
            photoData = try PropertyListEncoder().encode(photo)
        } catch {
            NSLog("Error encoding photo: \(error)")
        }
        
        guard let photo = photoData else { return }
        
        coder.encode(photo, forKey: "photoData")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        defer { super.decodeRestorableState(with: coder)}
        
        guard let photoData = coder.decodeObject(forKey: "photoData") as? Data else { return }
        
        self.photo = try? PropertyListDecoder().decode(MarsPhotoReference.self, from: photoData)
    }
    
}
