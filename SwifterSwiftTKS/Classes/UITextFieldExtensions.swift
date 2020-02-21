//
//  UITextFieldExtensions.swift
//  SwifterSwift
//
//  Created by Omar Albeik on 8/5/16.
//  Copyright © 2016 SwifterSwift
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

// MARK: - Enums
public extension UITextField {
    
    /// SwifterSwift: UITextField text type.
    ///
    /// - emailAddress: UITextField is used to enter email addresses.
    /// - password: UITextField is used to enter passwords.
    /// - generic: UITextField is used to enter generic text.
    enum TextType {
        /// UITextField is used to enter email addresses.
        case emailAddress
        
        /// UITextField is used to enter passwords.
        case password
        
        /// UITextField is used to enter generic text.
        case generic
    }
    
}

// MARK: - Properties
public extension UITextField {
    
    /// SwifterSwift: Set textField for common text types.
    var textType: TextType {
        get {
            if keyboardType == .emailAddress {
                return .emailAddress
            } else if isSecureTextEntry {
                return .password
            }
            return .generic
        }
        set {
            switch newValue {
            case .emailAddress:
                keyboardType = .emailAddress
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = false
                placeholder = "Email Address"
                
            case .password:
                keyboardType = .asciiCapable
                autocorrectionType = .no
                autocapitalizationType = .none
                isSecureTextEntry = true
                placeholder = "Password"
                
            case .generic:
                isSecureTextEntry = false
            }
        }
    }
    
    /// SwifterSwift: Check if text field is empty.
    var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    /// SwifterSwift: Return text with no spaces or new lines in beginning and end.
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// SwifterSwift: Check if textFields text is a valid email format.
    ///
    ///		textField.text = "john@doe.com"
    ///		textField.hasValidEmail -> true
    ///
    ///		textField.text = "swifterswift"
    ///		textField.hasValidEmail -> false
    ///
    var hasValidEmail: Bool {
        // http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
        return text!.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                           options: String.CompareOptions.regularExpression,
                           range: nil, locale: nil) != nil
    }
    
    /// SwifterSwift: Left view tint color.
    @IBInspectable  var leftViewTintColor: UIColor? {
        get {
            guard let iconView = leftView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = leftView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
    /// SwifterSwift: Right view tint color.
    @IBInspectable  var rightViewTintColor: UIColor? {
        get {
            guard let iconView = rightView as? UIImageView else { return nil }
            return iconView.tintColor
        }
        set {
            guard let iconView = rightView as? UIImageView else { return }
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = newValue
        }
    }
    
}

// MARK: - Methods
public extension UITextField {
    
    /// SwifterSwift: Clear text.
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    /// SwifterSwift: Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    func setPlaceHolderTextColor(_ color: UIColor) {
        guard let holder = placeholder, !holder.isEmpty else { return }
        attributedPlaceholder = NSAttributedString(string: holder, attributes: [.foregroundColor: color])
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameter padding: amount of padding to apply to the left of the textfield rect.
    func addPaddingLeft(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
    /// SwifterSwift: Add padding to the left of the textfield rect.
    ///
    /// - Parameters:
    ///   - image: left image
    ///   - padding: amount of padding between icon and the left of textfield
    func addPaddingLeftIcon(_ image: UIImage, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .center
        leftView = imageView
        leftView?.frame.size = CGSize(width: image.size.width + padding, height: image.size.height)
        leftViewMode = .always
    }
    
    /// SwifterSwift: Add an image to the left of a UITextField
    ///
    /// - Parameters:
    ///   - image: image to add
    ///   - spacing: amount of padding between the image and the start of the text input. By default, 20.0
    ///   - contentMode: content mode of the image. By default, scaleAspectFit
    func setLeftViewImage(_ image: UIImage,
                          spacing: CGFloat = 20.0,
                          contentMode: UIView.ContentMode = .scaleAspectFit) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        setView(imageView, edge: .left, spacing: spacing)
    }
    
    /// SwifterSwift: Add an image to the right of a UITextField
    ///
    /// - Parameters:
    ///   - image: image to add
    ///   - spacing: amount of padding between the image and the end of the text input. By default, 20.0
    ///   - contentMode: content mode of the image. By default, scaleAspectFit
    func setRightViewImage(_ image: UIImage,
                           spacing: CGFloat = 20.0,
                           contentMode: UIView.ContentMode = .scaleAspectFit) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        setView(imageView, edge: .right, spacing: spacing)
    }
    
    /// SwifterSwift: Add a button to the left of a UITextField
    ///
    /// - Parameters:
    ///   - button: button to add
    ///   - spacing: amount of padding between the button and the start of the text input. By default, 20.0
    ///   - contentMode: content mode of the button image. By default, scaleAspectFit
    func setLeftViewButton(_ button: UIButton,
                          spacing: CGFloat = 20.0,
                          contentMode: UIView.ContentMode = .scaleAspectFit) {
        button.imageView?.contentMode = contentMode
        setView(button, edge: .left, spacing: spacing)
    }
    
    /// SwifterSwift: Add a button to the right of a UITextField
    ///
    /// - Parameters:
    ///   - button: button to add
    ///   - spacing: amount of padding between the button and the end of the text input. By default, 20.0
    ///   - contentMode: content mode of the button image. By default, scaleAspectFit
    func setRightViewButton(_ button: UIButton,
                           spacing: CGFloat = 20.0,
                           contentMode: UIView.ContentMode = .scaleAspectFit) {
        button.imageView?.contentMode = contentMode
        setView(button, edge: .right, spacing: spacing)
    }
    
    /// Add a view to the left or right side of a UITextField
    ///
    /// - Parameters:
    ///   - view: view to add
    ///   - edge: left or right
    ///   - spacing: amount of padding between the view and the start or the end of the text input. By default, 20.0
    func setView(_ view: UIView, edge: UIRectEdge, spacing: CGFloat = 20.0) {
        guard edge == .left || edge == .right else {
            return
        }
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.height + spacing, height: bounds.height))
        containerView.backgroundColor = .clear
        containerView.addSubview(view)
        view.frame = CGRect(x: edge == .left ? 0 : spacing, y: 0, width: containerView.height, height: containerView.height)
        
        if edge == .left {
            leftView = containerView
            leftViewMode = .always
        } else {
            rightView = containerView
            rightViewMode = .always
        }
    }
    
}

#endif
