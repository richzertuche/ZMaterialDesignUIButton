# ZMaterialDesignUIButton
<h6>Swift Animated Material Design UIButton</h6>

<p>This Swift UIButton was made inspired in Google new Material Design, and this GIF :]</p>

<img src="http://i.imgur.com/PAw22Gn.gif"/>
<br>
[![ZMaterialButton](http://img.youtube.com/vi/LApnUpnI094/0.jpg)](http://www.youtube.com/watch?v=LApnUpnI094)
<br>
<br>
**You need to add the ZMaterialButtonDelegate to your Controller:**

```swift
class ViewController: UIViewController, ZMaterialButtonDelegate {
}
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
