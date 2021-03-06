//
//  Snap
//
//  Copyright (c) 2011-2014 Masonry Team - https://github.com/Masonry
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if os(iOS)
import UIKit
#else
import AppKit
#endif

/**
 * Constraint is a single item that defines all the properties for a single ConstraintMaker chain
 */
final public class Constraint {
    public var left: Constraint { return self.addConstraint(ConstraintAttributes.Left) }
    public var top: Constraint { return self.addConstraint(ConstraintAttributes.Top) }
    public var right: Constraint { return self.addConstraint(ConstraintAttributes.Right) }
    public var bottom: Constraint { return self.addConstraint(ConstraintAttributes.Bottom) }
    public var leading: Constraint { return self.addConstraint(ConstraintAttributes.Leading) }
    public var trailing: Constraint { return self.addConstraint(ConstraintAttributes.Trailing) }
    public var width: Constraint { return self.addConstraint(ConstraintAttributes.Width) }
    public var height: Constraint { return self.addConstraint(ConstraintAttributes.Height) }
    public var centerX: Constraint { return self.addConstraint(ConstraintAttributes.CenterX) }
    public var centerY: Constraint { return self.addConstraint(ConstraintAttributes.CenterY) }
    public var baseline: Constraint { return self.addConstraint(ConstraintAttributes.Baseline) }
    
    public var and: Constraint {
        if self.relation != nil {
            fatalError("And is semantic only and can only be used before a relation is set.")
        }
        return self
    }
    public var with: Constraint { return self }
    
    // MARK: initializer
    
    internal init(fromItem: ConstraintItem) {
        self.fromItem = fromItem
        self.toItem = ConstraintItem(object: nil, attributes: ConstraintAttributes.None)
    }
    
    // MARK: equalTo
    
    public func equalTo(other: ConstraintItem) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: View) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    #if os(iOS)
    public func equalTo(other: UILayoutSupport) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    #endif
    public func equalTo(other: Float) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: Double) -> Constraint {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: CGFloat) -> Constraint {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: Int) -> Constraint {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: UInt) -> Constraint {
        return self.constrainTo(Float(other), relation: .Equal)
    }
    public func equalTo(other: CGSize) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: CGPoint) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    public func equalTo(other: EdgeInsets) -> Constraint {
        return self.constrainTo(other, relation: .Equal)
    }
    
    // MARK: lessThanOrEqualTo
    
    public func lessThanOrEqualTo(other: ConstraintItem) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: View) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #if os(iOS)
    public func lessThanOrEqualTo(other: UILayoutSupport) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    #endif
    public func lessThanOrEqualTo(other: Float) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: Double) -> Constraint {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: CGFloat) -> Constraint {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: Int) -> Constraint {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: UInt) -> Constraint {
        return self.constrainTo(Float(other), relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: CGSize) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: CGPoint) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    public func lessThanOrEqualTo(other: EdgeInsets) -> Constraint {
        return self.constrainTo(other, relation: .LessThanOrEqualTo)
    }
    
    // MARK: greaterThanOrEqualTo
    
    public func greaterThanOrEqualTo(other: ConstraintItem) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: View) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #if os(iOS)
    public func greaterThanOrEqualTo(other: UILayoutSupport) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    #endif
    public func greaterThanOrEqualTo(other: Float) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: Double) -> Constraint {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: CGFloat) -> Constraint {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: Int) -> Constraint {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: UInt) -> Constraint {
        return self.constrainTo(Float(other), relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: CGSize) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: CGPoint) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    public func greaterThanOrEqualTo(other: EdgeInsets) -> Constraint {
        return self.constrainTo(other, relation: .GreaterThanOrEqualTo)
    }
    
    // MARK: multiplier
    
    public func multipliedBy(amount: Float) -> Constraint {
        self.multiplier = amount
        return self
    }
    public func multipliedBy(amount: Double) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: CGFloat) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: Int) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    public func multipliedBy(amount: UInt) -> Constraint {
        return self.multipliedBy(Float(amount))
    }
    
    public func dividedBy(amount: Float) -> Constraint {
        self.multiplier = 1.0 / amount;
        return self
    }
    public func dividedBy(amount: Double) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    public func dividedBy(amount: CGFloat) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    public func dividedBy(amount: Int) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    public func dividedBy(amount: UInt) -> Constraint {
        return self.dividedBy(Float(amount))
    }
    
    // MARK: priority
    
    public func priority(priority: Float) -> Constraint {
        self.priority = priority
        return self
    }
    public func priority(priority: Double) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priority(priority: CGFloat) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priority(priority: UInt) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priority(priority: Int) -> Constraint {
        return self.priority(Float(priority))
    }
    public func priorityRequired() -> Constraint {
        return self.priority(1000.0)
    }
    public func priorityHigh() -> Constraint {
        return self.priority(750.0)
    }
    public func priorityMedium() -> Constraint {
        #if os(iOS)
        return self.priority(500.0)
        #else
        return self.priority(501.0)
        #endif
    }
    public func priorityLow() -> Constraint {
        return self.priority(250.0)
    }
    
    // MARK: offset
    
    public func offset(amount: Float) -> Constraint {
        self.offset = amount
        return self
    }
    public func offset(amount: Double) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: CGFloat) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: Int) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: UInt) -> Constraint {
        return self.offset(Float(amount))
    }
    public func offset(amount: CGPoint) -> Constraint {
        self.offset = amount
        return self
    }
    public func offset(amount: CGSize) -> Constraint {
        self.offset = amount
        return self
    }
    public func offset(amount: EdgeInsets) -> Constraint {
        self.offset = amount
        return self
    }
    
    // MARK: insets
    
    public func insets(amount: EdgeInsets) -> Constraint {
        self.offset = amount
        return self
    }
    
    // MARK: install / uninstall
    
    public func install() -> [LayoutConstraint] {
        return self.installOnView(updateExisting: false)
    }
    
    public func uninstall() {
        self.uninstallFromView()
    }
    
    public func activate() {
        if NSLayoutConstraint.respondsToSelector("activateConstraints:") && self.installInfo != nil {
            let layoutConstraints = self.installInfo!.layoutConstraints.allObjects as! [LayoutConstraint]
            if layoutConstraints.count > 0 {
                NSLayoutConstraint.activateConstraints(layoutConstraints)
            }
        } else {
            self.install()
        }
    }
    
    public func deactivate() {
        if NSLayoutConstraint.respondsToSelector("deactivateConstraints:") && self.installInfo != nil {
            let layoutConstraints = self.installInfo!.layoutConstraints.allObjects as! [LayoutConstraint]
            if layoutConstraints.count > 0 {
                NSLayoutConstraint.deactivateConstraints(layoutConstraints)
            }
        } else {
            self.uninstall()
        }
    }
    
    // MARK: internal
    
    internal func installOnView(updateExisting: Bool = false) -> [LayoutConstraint] {
        var installOnView: View? = nil
        if self.toItem.view != nil {
            installOnView = Constraint.closestCommonSuperviewFromView(self.fromItem.view, toView: self.toItem.view)
            if installOnView == nil {
                NSException(name: "Cannot Install Constraint", reason: "No common superview between views", userInfo: nil).raise()
                return []
            }
        } else {
            installOnView = self.fromItem.view?.superview
            if installOnView == nil {
                if self.fromItem.attributes == ConstraintAttributes.Width || self.fromItem.attributes == ConstraintAttributes.Height {
                    installOnView = self.fromItem.view
                }
                
                if installOnView == nil {
                    NSException(name: "Cannot Install Constraint", reason: "Missing superview", userInfo: nil).raise()
                    return []
                }
            }
        }
        
        if let installedOnView = self.installInfo?.view {
            if installedOnView != installOnView {
                NSException(name: "Cannot Install Constraint", reason: "Already installed on different view.", userInfo: nil).raise()
                return []
            }
            return self.installInfo?.layoutConstraints.allObjects as? [LayoutConstraint] ?? []
        }
        
        var newLayoutConstraints = [LayoutConstraint]()
        let layoutFromAttributes = self.fromItem.attributes.layoutAttributes
        let layoutToAttributes = self.toItem.attributes.layoutAttributes
        
        // get layout from
        let layoutFrom: View? = self.fromItem.view
        
        // get layout relation
        let layoutRelation: NSLayoutRelation = (self.relation != nil) ? self.relation!.layoutRelation : .Equal
        
        for layoutFromAttribute in layoutFromAttributes {
            // get layout to attribute
            let layoutToAttribute = (layoutToAttributes.count > 0) ? layoutToAttributes[0] : layoutFromAttribute
            
            // get layout constant
            var layoutConstant: CGFloat = layoutToAttribute.snp_constantForValue(self.constant)
            layoutConstant += layoutToAttribute.snp_offsetForValue(self.offset)
            
            // get layout to
            var layoutTo: View? = self.toItem.view
            if layoutTo == nil && layoutToAttribute != .Width && layoutToAttribute != .Height {
                layoutTo = installOnView
            }
            
            // create layout constraint
            let layoutConstraint = LayoutConstraint(
                item: layoutFrom!,
                attribute: layoutFromAttribute,
                relatedBy: layoutRelation,
                toItem: layoutTo,
                attribute: layoutToAttribute,
                multiplier: CGFloat(self.multiplier),
                constant: layoutConstant)
            
            // set priority
            layoutConstraint.priority = self.priority
            
            // set constraint
            layoutConstraint.snp_constraint = self
            
            newLayoutConstraints.append(layoutConstraint)
        }
        
        // special logic for updating
        if updateExisting {
            // get existing constraints for this view
            let existingLayoutConstraints = reverse(layoutFrom!.snp_installedLayoutConstraints)
            
            // array that will contain only new layout constraints to keep
            var newLayoutConstraintsToKeep = [LayoutConstraint]()

            // begin looping
            for layoutConstraint in newLayoutConstraints {
                // layout constraint that should be updated
                var updateLayoutConstraint: LayoutConstraint? = nil
                
                // loop through existing and check for match
                for existingLayoutConstraint in existingLayoutConstraints {
                    if existingLayoutConstraint == layoutConstraint {
                        updateLayoutConstraint = existingLayoutConstraint
                        break
                    }
                }
                
                // if we have existing one lets just update the constant
                if updateLayoutConstraint != nil {
                    updateLayoutConstraint!.constant = layoutConstraint.constant
                }
                // otherwise add this layout constraint to new keep list
                else {
                    newLayoutConstraintsToKeep.append(layoutConstraint)
                }
            }

            // set constraints to only new ones
            newLayoutConstraints = newLayoutConstraintsToKeep
        }
        
        // add constraints
        installOnView!.addConstraints(newLayoutConstraints)
        
        // set install info
        self.installInfo = ConstraintInstallInfo(view: installOnView, layoutConstraints: NSHashTable.weakObjectsHashTable())
        
        // store which layout constraints are installed for this constraint
        for layoutConstraint in newLayoutConstraints {
            self.installInfo!.layoutConstraints.addObject(layoutConstraint)
        }
        
        // store the layout constraints against the layout from view
        layoutFrom!.snp_installedLayoutConstraints += newLayoutConstraints
        
        // return the new constraints
        return newLayoutConstraints
    }
    
    internal func uninstallFromView() {
        if let installInfo = self.installInfo,
           let installedLayoutConstraints = installInfo.layoutConstraints.allObjects as? [LayoutConstraint] {
            
            if installedLayoutConstraints.count > 0 {
                
                if let installedOnView = installInfo.view {
                    // remove the constraints from the UIView's storage
                    installedOnView.removeConstraints(installedLayoutConstraints)
                }
                
                // remove the constraints from the from item view
                if let fromView = self.fromItem.view {
                    fromView.snp_installedLayoutConstraints = fromView.snp_installedLayoutConstraints.filter {
                        return !contains(installedLayoutConstraints, $0)
                    }
                }
            }
            
        }
        self.installInfo = nil
    }
    
    // MARK: private
    
    private let fromItem: ConstraintItem
    private var toItem: ConstraintItem
    private var relation: ConstraintRelation?
    private var constant: Any = Float(0.0)
    private var multiplier: Float = 1.0
    private var priority: Float = 1000.0
    private var offset: Any = Float(0.0)
    
    private var installInfo: ConstraintInstallInfo?
    
    private func addConstraint(attributes: ConstraintAttributes) -> Constraint {
        if self.relation == nil {
            self.fromItem.attributes += attributes
        }
        return self
    }
    
    private func constrainTo(other: ConstraintItem, relation: ConstraintRelation) -> Constraint {
        if other.attributes != ConstraintAttributes.None {
            let toLayoutAttributes = other.attributes.layoutAttributes
            if toLayoutAttributes.count > 1 {
                let fromLayoutAttributes = self.fromItem.attributes.layoutAttributes
                if toLayoutAttributes != fromLayoutAttributes {
                    NSException(name: "Invalid Constraint", reason: "Cannot constrain to multiple non identical attributes", userInfo: nil).raise()
                    return self
                }
                other.attributes = ConstraintAttributes.None
            }
        }
        self.toItem = other
        self.relation = relation
        return self
    }
    private func constrainTo(other: View, relation: ConstraintRelation) -> Constraint {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #if os(iOS)
    private func constrainTo(other: UILayoutSupport, relation: ConstraintRelation) -> Constraint {
        return constrainTo(ConstraintItem(object: other, attributes: ConstraintAttributes.None), relation: relation)
    }
    #endif
    private func constrainTo(other: Float, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: Double, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGSize, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: CGPoint, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    private func constrainTo(other: EdgeInsets, relation: ConstraintRelation) -> Constraint {
        self.constant = other
        return constrainTo(ConstraintItem(object: nil, attributes: ConstraintAttributes.None), relation: relation)
    }
    
    private class func closestCommonSuperviewFromView(fromView: View?, toView: View?) -> View? {
        var views = Set<View>()
        var fromView = fromView
        var toView = toView
        do {
            if let view = toView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                toView = view.superview
            }
            if let view = fromView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                fromView = view.superview
            }
        } while (fromView != nil || toView != nil)
        
        return nil
    }
}

private extension NSLayoutAttribute {
    
    private func snp_offsetForValue(value: Any?) -> CGFloat {
        // Float
        if let float = value as? Float {
            return CGFloat(float)
        }
        // Double
        else if let double = value as? Double {
            return CGFloat(double)
        }
        // UInt
        else if let int = value as? Int {
            return CGFloat(int)
        }
        // Int
        else if let uint = value as? UInt {
            return CGFloat(uint)
        }
        // CGFloat
        else if let float = value as? CGFloat {
            return float
        }
        // CGSize
        else if let size = value as? CGSize {
            if self == .Width {
                return size.width
            } else if self == .Height {
                return size.height
            }
        }
        // CGPoint
        else if let point = value as? CGPoint {
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return point.x
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return point.y
            case .Right, .RightMargin: return -point.x
            case .Bottom, .BottomMargin: return -point.y
            case .Leading, .LeadingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? point.x : -point.x
            case .Trailing, .TrailingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? -point.x : point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return point.x
            case .Top, .CenterY, .Baseline: return point.y
            case .Right: return -point.x
            case .Bottom: return -point.y
            case .Leading: return (Config.interfaceLayoutDirection == .LeftToRight) ? point.x : -point.x
            case .Trailing: return (Config.interfaceLayoutDirection == .LeftToRight) ? -point.x : point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return insets.left
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return insets.top
            case .Right, .RightMargin: return -insets.right
            case .Bottom, .BottomMargin: return -insets.bottom
            case .Leading, .LeadingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
            case .Trailing, .TrailingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? -insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return insets.left
            case .Top, .CenterY, .Baseline: return insets.top
            case .Right: return -insets.right
            case .Bottom: return -insets.bottom
            case .Leading: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : -insets.right
            case .Trailing: return (Config.interfaceLayoutDirection == .LeftToRight) ? -insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        
        return CGFloat(0)
    }
    
    private func snp_constantForValue(value: Any?) -> CGFloat {
        // Float
        if let float = value as? Float {
            return CGFloat(float)
        }
        // Double
        else if let double = value as? Double {
            return CGFloat(double)
        }
        // UInt
        else if let int = value as? Int {
            return CGFloat(int)
        }
        // Int
        else if let uint = value as? UInt {
            return CGFloat(uint)
        }
        // CGFloat
        else if let float = value as? CGFloat {
            return float
        }
        // CGSize
        else if let size = value as? CGSize {
            if self == .Width {
                return size.width
            } else if self == .Height {
                return size.height
            }
        }
        // CGPoint
        else if let point = value as? CGPoint {
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return point.x
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return point.y
            case .Right, .RightMargin: return point.x
            case .Bottom, .BottomMargin: return point.y
            case .Leading, .LeadingMargin: return point.x
            case .Trailing, .TrailingMargin: return point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return point.x
            case .Top, .CenterY, .Baseline: return point.y
            case .Right: return point.x
            case .Bottom: return point.y
            case .Leading: return point.x
            case .Trailing: return point.x
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        // EdgeInsets
        else if let insets = value as? EdgeInsets {
            #if os(iOS)
            switch self {
            case .Left, .CenterX, .LeftMargin, .CenterXWithinMargins: return insets.left
            case .Top, .CenterY, .TopMargin, .CenterYWithinMargins, .Baseline, .FirstBaseline: return insets.top
            case .Right, .RightMargin: return insets.right
            case .Bottom, .BottomMargin: return insets.bottom
            case .Leading, .LeadingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : insets.right
            case .Trailing, .TrailingMargin: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #else
            switch self {
            case .Left, .CenterX: return insets.left
            case .Top, .CenterY, .Baseline: return insets.top
            case .Right: return insets.right
            case .Bottom: return insets.bottom
            case .Leading: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.left : insets.right
            case .Trailing: return (Config.interfaceLayoutDirection == .LeftToRight) ? insets.right : insets.left
            case .Width, .Height, .NotAnAttribute: return CGFloat(0)
            }
            #endif
        }
        
        return CGFloat(0);
    }
}

private struct ConstraintInstallInfo {
    
    weak var view: View? = nil
    let layoutConstraints: NSHashTable
    
}


internal func ==(left: Constraint, right: Constraint) -> Bool {
    return (left.fromItem == right.fromItem &&
            left.toItem == right.toItem &&
            left.relation == right.relation &&
            left.multiplier == right.multiplier &&
            left.priority == right.priority)
}