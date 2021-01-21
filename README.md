![Logo](https://github.com/dejacs/AttributedTextURL/blob/main/Attributedtexturl.png)

#### Hello, everyone! Welcome to my teeny-tiny library :teddy_bear:

There are many designed app screens that have a text with a link in the middle of it. Thus, in order to ease its implementation, this library was made to provide a formatted `NSMutableAttributedString` to be configured in your `UITextView`.

This is the step-by-step:
- Add this line in your Podfile and run `pod install`:
```
pod 'AttributedTextURL', '~> 0.0.3'
```
- Create an `UITextView`, such as:
```
private lazy var textView: UITextView = {
    let text = UITextView()
    text.isEditable = false
    text.isSelectable = true
    text.isScrollEnabled = false
    text.translatesAutoresizingMaskIntoConstraints = false
    return text
}()
```
- On `viewDidLoad`, setup text view delegate and link text attributes:
```
textView.delegate = self
textView.linkTextAttributes = [ * your link attributes here, for style * ]
```
- Make your `UIViewController` implement `UITextViewDelegate` and import `SafariServices`:
```
extension ViewController: UITextViewDelegate {
    func textView(
        _ textView: UITextView,
        shouldInteractWith URL: URL,
        in characterRange: NSRange,
        interaction: UITextItemInteraction
    ) -> Bool {
        let safariViewController = SFSafariViewController(url: URL)
        present(safariViewController, animated: true)
        return false
    }
}
```
- **Here is the library usage.** On `viewDidLoad`, call a method that will configure the parameters for your `UITextView`:
```
func setupAttributedText() {
    let attributedText = AttributedTextWithURLHelper.getAttributedStringWithSingleURL(
        text: * your full text here, but with `%@` where your link is going to be *,
        styleAttributes: [ * your full text attributes here, for style * ],
        link: LinkInfo(text: * your link text here *, urlAddress: * your url address here *)
    )
    textView.attributedText = attributedText
}
```
That's it! :trophy:

Any doubts? Here is an example of usage: https://github.com/dejacs/AttributedTextURL/tree/main/AttributedTextURLExamples/Example

Also, you can contact me here: https://twitter.com/Mockada

Hope you enjoy it :sparkles:

Cocoapods link: https://cocoapods.org/pods/AttributedTextURL
