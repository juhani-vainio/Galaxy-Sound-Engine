//
//  HexaTableViewCell.swift
//  SoundEngine
//
//  Created by Juhani Vainio on 10/12/2018.
//  Copyright © 2018 JuhaniVainio. All rights reserved.
//

import UIKit

class HexaTableViewCell: UITableViewCell {
    
    var id = String()
    @IBOutlet weak var coloringView: UIView!
    @IBOutlet weak var specialSwitch: UISwitch!
    @IBOutlet weak var specialTitle: UILabel!
    @IBOutlet weak var specialViewArea: UIView!
    @IBOutlet weak var specialViewHeight: NSLayoutConstraint!
    @IBOutlet weak var specialView: UIView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var sliders = [String]()
    

    @IBOutlet weak var slider6Value: UILabel!
    @IBOutlet weak var slider6Title: UILabel!
    @IBOutlet weak var slider6: UISlider!
    @IBOutlet weak var slider5Value: UILabel!
    @IBOutlet weak var slider5Title: UILabel!
    @IBOutlet weak var slider5: UISlider!
    @IBOutlet weak var slider4Value: UILabel!
    @IBOutlet weak var slider4Title: UILabel!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider3Value: UILabel!
    @IBOutlet weak var slider3Title: UILabel!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider2Value: UILabel!
    @IBOutlet weak var slider2Title: UILabel!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider1Value: UILabel!
    @IBOutlet weak var slider1Title: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var onOffButton: UIButton!
    @IBOutlet weak var controllerHeight: NSLayoutConstraint!
    @IBOutlet weak var controllersView: UIView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        coloringView.layer.cornerRadius = coloringView.bounds.width / 2
        
        
        controllersView.layer.cornerRadius = 8
    
        
        
        slider1.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider2.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider3.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider4.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider5.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider6.addTarget(self, action: #selector(valueChanged), for: .valueChanged)

        
        onOffButton.addTarget(self, action: #selector(toggleOnOff), for: .touchDown)
        
        
        specialViewArea.layer.cornerRadius = 8
        
        specialSwitch.transform = CGAffineTransform(scaleX: 0.7, y: 0.7);
        
        
        specialSwitch.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        onOffButton.layer.borderWidth = 2
       
        onOffButton.layer.cornerRadius = onOffButton.bounds.height / 2
        
        
    }
    
    func setColors() {
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
        self.title.textColor = interface.text
        self.slider1Value.textColor = interface.text
        self.slider1Title.textColor = interface.text
        self.slider2Title.textColor = interface.text
        self.slider2Value.textColor = interface.text
        self.slider3Title.textColor = interface.text
        self.slider3Value.textColor = interface.text
        self.slider4Title.textColor = interface.text
        self.slider4Value.textColor = interface.text
        self.slider5Value.textColor = interface.text
        self.slider5Title.textColor = interface.text
        self.slider6Title.textColor = interface.text
        self.slider6Value.textColor = interface.text
            self.onOffButton.backgroundColor = UIColor.clear
        specialViewArea.backgroundColor = interface.tab
        self.controllersView.backgroundColor = interface.tab
        specialSwitch.onTintColor = interface.theme2
        specialTitle.textColor = interface.text
         onOffButton.layer.borderColor = interface.text.cgColor
        // specialSwitch.tintColor = interface.negative
        
        controllersView.backgroundColor = interface.tableBackground
        slider1.minimumTrackTintColor = interface.sliderMin
        slider1.maximumTrackTintColor = interface.sliderMax
        slider1.thumbTintColor = interface.sliderThumb
        slider2.minimumTrackTintColor = interface.sliderMin
        slider2.maximumTrackTintColor = interface.sliderMax
        slider2.thumbTintColor = interface.sliderThumb
        slider3.minimumTrackTintColor = interface.sliderMin
        slider3.maximumTrackTintColor = interface.sliderMax
        slider3.thumbTintColor = interface.sliderThumb
        slider4.minimumTrackTintColor = interface.sliderMin
        slider4.maximumTrackTintColor = interface.sliderMax
        slider4.thumbTintColor = interface.sliderThumb
        slider5.minimumTrackTintColor = interface.sliderMin
        slider5.maximumTrackTintColor = interface.sliderMax
        slider5.thumbTintColor = interface.sliderThumb
        slider6.minimumTrackTintColor = interface.sliderMin
        slider6.maximumTrackTintColor = interface.sliderMax
        slider6.thumbTintColor = interface.sliderThumb
    }
    
    @objc func switchValueChanged(toggle: UISwitch) {
        audio.shared.toggleOnOff(id: self.id, isOn: toggle.isOn)
    }
    
    func setOnOff() {
        if onOffButton.titleLabel?.text == "ON" {
            onOffButton.setTitleColor(interface.text, for: .normal)
            slider1.isEnabled = true
            slider2.isEnabled = true
            slider3.isEnabled = true
            slider4.isEnabled = true
            slider5.isEnabled = true
            slider6.isEnabled = true
       
            
        } else {
            onOffButton.setTitleColor(interface.textIdle, for: .normal)
            if (slider1Title.text?.contains("ix"))! {
                slider1.isEnabled = false
            }
            if (slider2Title.text?.contains("ix"))! {
                slider2.isEnabled = false
            }
            if (slider3Title.text?.contains("ix"))! {
                slider3.isEnabled = false
            }
            if (slider4Title.text?.contains("ix"))! {
                slider4.isEnabled = false
            }
            if (slider5Title.text?.contains("ix"))! {
                slider5.isEnabled = false
            }
            if (slider6Title.text?.contains("ix"))!  || (slider6Title.text?.contains("Volume"))! {
                slider6.isEnabled = false
            }
    
            
        }
        
    }
    
    @objc func toggleOnOff() {
        let text = audio.shared.changeValues(id:self.id, slider: 0, value: 0)
        print(text)
        onOffButton.setTitle(text, for: .normal)
        setOnOff()
    }
    
    @objc func valueChanged(slider: UISlider) {
        switch slider {
        case slider1: slider1Value.text = audio.shared.changeValues(id:self.id, slider: 1, value: Double(slider.value))
        case slider2: slider2Value.text = audio.shared.changeValues(id:self.id, slider: 2, value: Double(slider.value))
        case slider3: slider3Value.text = audio.shared.changeValues(id:self.id, slider: 3, value: Double(slider.value))
        case slider4: slider4Value.text = audio.shared.changeValues(id:self.id, slider: 4, value: Double(slider.value))
        case slider5: slider5Value.text = audio.shared.changeValues(id:self.id, slider: 5, value: Double(slider.value))
        case slider6: slider6Value.text = audio.shared.changeValues(id:self.id, slider: 6, value: Double(slider.value))
        
        default: break
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}