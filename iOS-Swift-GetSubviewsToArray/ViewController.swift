//
//  ViewController.swift
//  iOS-Swift-GetSubviewsToArray
//
//  Created by Pooya on 2020-05-08.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainStack : UIStackView!
    
    var listofallsubViews : [UIView] = []
    var listofallLabels : [UILabel] = []
    var listofallButtons : [UIButton] = []
    var listofallTextFields : [UITextField] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listofallsubViews = mainStack.subviews
        listofallLabels = mainStack.allSubViewsOf(type: UILabel.self)
        listofallButtons = mainStack.allSubViewsOf(type: UIButton.self)
        listofallTextFields = mainStack.allSubViewsOf(type: UITextField.self)

        print(listofallsubViews)
        
    }


    @IBAction func removeLabels(_ sender: Any) {
        listofallLabels.forEach({ $0.removeFromSuperview() }) // this gets things done
    }
    
    @IBAction func removeTextFields(_ sender: Any) {
        listofallTextFields.forEach({ $0.removeFromSuperview() }) // this gets things done
    }
    
    @IBAction func removeButtons(_ sender: Any) {
        listofallButtons.forEach({ $0.removeFromSuperview() }) // this gets things done
    }
    
    
}


extension UIView {
    /** This is the function to get subViews of a view of a particular type
     */
    func subViews<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        for view in self.subviews {
            if let aView = view as? T{
                all.append(aView)
            }
        }
        return all
    }
    
    
    /** This is a function to get subViews of a particular type from view recursively. It would look recursively in all subviews and return back the subviews of the type T */
    func allSubViewsOf<T : UIView>(type : T.Type) -> [T]{
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T{
                all.append(aView)
            }
            guard view.subviews.count>0 else { return }
            view.subviews.forEach{ getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
    
    //    let allSubviews = view.allSubViewsOf(type: UIView.self)
    //    let allLabels = view.allSubViewsOf(type: UILabel.self)
}
