//
//  ViewController.swift
//  Exo4
//
//  Created by Cédric Debroux on 17/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var mImageView: UIImageView!
    
    @IBOutlet weak var mPickerView: UIPickerView!
    
    @IBOutlet weak var mTextView: UITextView!
    
    @IBOutlet weak var label: UILabel!
    
    var heroes = [Hero]()
    var color = [Color]()
    var story = [Story]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = NSLocalizedString("Welcom_message", comment: "")
        
        mPickerView.delegate = self
        mPickerView.dataSource = self
        
        
        mSegmentedControl.removeAllSegments()
        mSegmentedControl.insertSegment(withTitle: "Hero", at: 0, animated: true)
        mSegmentedControl.insertSegment(withTitle: "Story", at: 1, animated: true)
        mSegmentedControl.addTarget(self, action: #selector(didTapSegmentControl(segmentedControl:)), for: .valueChanged)
        
        loadHero()
        loadColor()
    }
    
    func loadHero(){
        
        heroes.append(Hero(name: "Black widow", image: UIImage(named: "black_widow")!))
        heroes.append(Hero(name: "Hulk", image: UIImage(named: "Hulk")!))
        heroes.append(Hero(name: "Ironman", image: UIImage(named: "Ironman")!))
        heroes.append(Hero(name: "spiderman", image: UIImage(named: "spiderman")!))
        heroes.append(Hero(name: "thor", image: UIImage(named: "thor")!))
    }
    
    func loadColor(){
        color.append(Color(colorName: "Red", backGroundColor: .red))
        color.append(Color(colorName: "Blue", backGroundColor: .blue))
        color.append(Color(colorName: "Yellow", backGroundColor: .yellow))
        color.append(Color(colorName: "Purple", backGroundColor: .purple))
        color.append(Color(colorName: "Black", backGroundColor: .black))
        color.append(Color(colorName: "Green", backGroundColor: .green))
        color.append(Color(colorName: "White", backGroundColor: .white))
    }
    
    @objc func didTapSegmentControl(segmentedControl:UISegmentedControl){
        if segmentedControl.selectedSegmentIndex == 0 {
         
            mImageView.isHidden = false
            mPickerView.isHidden = false
            mTextView.isHidden = true
            
        }else{
            mTextView.isHidden = false
            mImageView.isHidden = true
            mPickerView.isHidden = true
        }
    }
    
    
}
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch component {
        case 0 :
           return heroes.count
        case 1 :
           return color.count
        default:
           return 0
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return heroes[row].name
        case 1:
            return color[row].colorName
        default:
           return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
        switch component {
        case 0:
            mImageView.image = heroes[row].image
        case 1:
            mImageView.backgroundColor = color[row].backGroundColor
        default:
            return
        }
        
        }

    override func viewDidAppear(_ animated: Bool) {
        mImageView.backgroundColor = .red
        mImageView.image = heroes[0].image
    }
    
}

