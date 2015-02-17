# ZMaterialDesignUIButton

<h6>Swift Animated Material Design UIButton</h6>

<p>This Swift UIButton was made inspired in Google new Material Design.
<br>
<br>
**You need to add the ZMaterialButtonDelegate to your Controller:**

```swift
class ViewController: UIViewController, ZMaterialButtonDelegate {
}
```
<br>
**To create a UIButtons Carousel just go on and create a ZCarousel variable with frame. 
Set thee delegate and use the method .addButtons() and add it to your view.**

```swift
var menu = ZCarousel(frame: CGRect( x: self.view.frame.size.width/5,
            y: 100,
            width: (self.view.frame.size.width/5)*3,
            height: 50))
menu.ZCdelegate = self
menu.addButtons(["iOS 8 by Tutorials", "Swift by Tutorials", "Core Data by Tutorials", "WatchKit by Tutorials"])
        
self.view.addSubview(menu!)
```

<br>
**To create a Material UIButton init it with frame and set the Zdelegate, a .endPoint (CGPoint) and a .changeToImage (UIImage)**
<br>

```swift
let containerView = UIView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height-200))
containerView.clipsToBounds = true
self.view.addSubview(containerView)
        
self.button = ZMaterialButton(frame: CGRect(x: 10, y: 40, width: 100, height: 100))
self.button.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
self.button.backgroundColor = UIColor(red:0.05, green:0.69, blue:0.79, alpha:1)
self.button.endPoint = CGPoint(x:self.view.center.x-50, y: self.view.center.y-50)
self.button.changeToImage = UIImage(named: "pause")
self.button.Zdelegate = self
containerView.addSubview(self.button)
```
<br>
**Add the delegate function ZMaterialButtonDidExpand() to your controller to know when the button expanded or reduced.**
<br>
```swift
func ZMaterialButtonDidExpand(button: ZMaterialButton, expanded: Bool){
        if expanded == true {
            self.testButtonExpanded()
            UIView.animateWithDuration(0.1, delay: 0, options: .CurveEaseOut, animations: {
                self.fButton.alpha = 1
                self.bButton.alpha = 1
                }, completion:nil)
        }
        else {
            self.testButtonReduced()
            UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
                self.fButton.alpha = 0
                self.bButton.alpha = 0
                }, completion:nil)
        }
    }
```

Hope you like it :]
<br>
<p>Follow me on Twitter <a href="https://www.twitter.com/richzertuche" target="_blank"> @richzertuche</a></p>
