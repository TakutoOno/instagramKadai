//
//  CommentViewController.swift
//  Instagram
//
//  Created by 小野 拓人 on 2022/05/17.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController{
    
    var postData: PostData!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendButton(_ sender: Any) {
        SVProgressHUD.show()
        
        var updateValue: FieldValue
        
        let name = Auth.auth().currentUser?.displayName
        
        
        let  comment = "\(name!) : \(self.commentTextField.text!) "
        
        updateValue = FieldValue.arrayUnion([comment])
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        
        postRef.updateData(["comments": updateValue])
        
        
        
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

