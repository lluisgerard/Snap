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
 * ConstraintMaker is the maker in snap that gets all constraints kickstarted
 */
final public class ConstraintMaker {
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
    
    #if os(iOS)
    public var firstBaseline: Constraint { return self.addConstraint(ConstraintAttributes.FirstBaseline) }
    public var leftMargin: Constraint { return self.addConstraint(ConstraintAttributes.LeftMargin) }
    public var rightMargin: Constraint { return self.addConstraint(ConstraintAttributes.RightMargin) }
    public var topMargin: Constraint { return self.addConstraint(ConstraintAttributes.TopMargin) }
    public var bottomMargin: Constraint { return self.addConstraint(ConstraintAttributes.BottomMargin) }
    public var leadingMargin: Constraint { return self.addConstraint(ConstraintAttributes.LeadingMargin) }
    public var trailingMargin: Constraint { return self.addConstraint(ConstraintAttributes.TrailingMargin) }
    public var centerXWithinMargins: Constraint { return self.addConstraint(ConstraintAttributes.CenterXWithinMargins) }
    public var centerYWithinMargins: Constraint { return self.addConstraint(ConstraintAttributes.CenterYWithinMargins) }
    #endif
    
    public var edges: Constraint { return self.addConstraint(ConstraintAttributes.Edges) }
    public var size: Constraint { return self.addConstraint(ConstraintAttributes.Size) }
    public var center: Constraint { return self.addConstraint(ConstraintAttributes.Center) }
    
    init(view: View) {
        self.view = view
    }
    
    internal weak var view: View?
    internal var constraints = [Constraint]()
    
    internal func addConstraint(attributes: ConstraintAttributes) -> Constraint {
        let item = ConstraintItem(object: self.view, attributes: attributes)
        let constraint = Constraint(fromItem: item)
        self.constraints.append(constraint)
        return constraint
    }
    
    internal class func prepareConstraints(view: View, @noescape block: (make: ConstraintMaker) -> Void) -> [Constraint] {
        let maker = ConstraintMaker(view: view)
        block(make: maker)
        return maker.constraints
    }
    
    internal class func makeConstraints(view: View, @noescape block: (make: ConstraintMaker) -> Void) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        block(make: maker)
        for constraint in maker.constraints {
            constraint.installOnView(updateExisting: false)
        }
    }
    
    internal class func remakeConstraints(view: View, @noescape block: (make: ConstraintMaker) -> Void) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        block(make: maker)
        
        self.removeConstraints(view)
        for constraint in maker.constraints {
            constraint.installOnView(updateExisting: false)
        }
    }
    
    internal class func updateConstraints(view: View, @noescape block: (make: ConstraintMaker) -> Void) {
        #if os(iOS)
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        #else
        view.translatesAutoresizingMaskIntoConstraints = false
        #endif
        let maker = ConstraintMaker(view: view)
        block(make: maker)
        
        for constraint in maker.constraints {
            constraint.installOnView(updateExisting: true)
        }
    }
    
    internal class func removeConstraints(view: View) {
        for existingLayoutConstraint in view.snp_installedLayoutConstraints {
            existingLayoutConstraint.snp_constraint?.uninstallFromView()
        }
    }
}