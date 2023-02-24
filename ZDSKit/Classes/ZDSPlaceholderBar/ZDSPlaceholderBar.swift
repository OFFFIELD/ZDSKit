import UIKit

public class ZDSPlaceholderBar: UIView {

    public var startPoint = 0.0
    
    private let shadowImage = UIImage(named: "placeholder_bar_shadow_effects", in: Bundle(for: ZDSPlaceholderBar.self), compatibleWith: nil)
    private let shadowImageView = UIImageView()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
        self.initAnimationLoop()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
        self.initAnimationLoop()
    }

    private func initView() {
        clipsToBounds = true
        
        shadowImageView.image = shadowImage?.stretchableImage(withLeftCapWidth: 0, topCapHeight: 1)
        addSubview(shadowImageView)
    }
    
    private func initAnimationLoop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.shadowImageView.frame = CGRect(x: self.startPoint - 160, y: 0, width: 160, height: self.frame.size.height)
            UIView.animate(withDuration: 3.0) { [weak self] in
                guard let self = self else { return }
                var targetFrame = self.shadowImageView.frame
                targetFrame.origin.x = UIScreen.main.bounds.width
                self.shadowImageView.frame = targetFrame
            } completion: { [weak self] (Bool) in
                guard let self = self else { return }
                if Bool {
                    self.initAnimationLoop()
                }
            }
        }
    }
}
