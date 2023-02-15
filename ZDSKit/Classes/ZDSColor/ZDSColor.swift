import UIKit

extension UIColor {
    
    /// ** RGB 常规模式 **
    /// - Parameters:
    ///   - R: 红色 数值 0 ~ 255
    ///   - G: 绿色 数值 0 ~ 255
    ///   - B: 蓝色 数值 0 ~ 255
    ///   - A: 透明 数值 0 ~ 100
    /// - Returns: 颜色对象
    public class func RGB(R: Int, G: Int, B: Int, A: CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: CGFloat(R) / 255.0, green: CGFloat(G) / 255.0, blue: CGFloat(B) / 255.0, alpha: A)
    }
    
    /// ** RGB 特征模式 **
    /// - Parameters:
    ///   - LRGB: 明亮 模式 RGB 数值 0 ~ 255
    ///   - LA:   明亮 模式 ALPHA 数值 0 ~ 1
    ///   - DRGB: 暗黑 模式 RGB 数值 0 ~ 255
    ///   - DA:   暗黑 模式 ALPHA 数值 0 ~ 1
    /// - Returns: 颜色对象
    public class func traitRGB(LRGB: (R: Int, G: Int, B: Int), LA: CGFloat = 1.0, DRGB: (R: Int, G: Int, B: Int), DA: CGFloat = 1.0) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.init(red: CGFloat(DRGB.R) / 255.0, green: CGFloat(DRGB.G) / 255.0, blue: CGFloat(DRGB.B) / 255.0, alpha: DA)
                default:
                    return UIColor.init(red: CGFloat(LRGB.R) / 255.0, green: CGFloat(LRGB.G) / 255.0, blue: CGFloat(LRGB.B) / 255.0, alpha: LA)
                }
            }
        } else {
            return UIColor.init(red: CGFloat(LRGB.R) / 255.0, green: CGFloat(LRGB.G) / 255.0, blue: CGFloat(LRGB.B) / 255.0, alpha: LA)
        }
    }
    
    /// ** RGB 随机模式 **
    /// - Parameters:
    ///   - R: 红 随机值 范围 Min 0 ~ 255 , Max 0 ~ 255
    ///   - G: 绿 随机值 范围 Min 0 ~ 255 , Max 0 ~ 255
    ///   - B: 蓝 随机值 范围 Min 0 ~ 255 , Max 0 ~ 255
    ///   - A: 透 随机值 范围 Min 0 ~ 100 , Max 0 ~ 100
    /// - Returns: 颜色对象
    public class func randomRGB(R: (min: Int, max: Int) = (0, 255), G: (min: Int, max: Int) = (0, 255), B: (min: Int, max: Int) = (0, 255), A: (min: Int, max: Int) = (0, 100)) -> UIColor {
        let R = R.min + ((R.max <= R.min) ? 0 : Int(arc4random() % UInt32(min(R.max, 255) - max(R.min, 0))))
        let G = G.min + ((G.max <= G.min) ? 0 : Int(arc4random() % UInt32(min(G.max, 255) - max(G.min, 0))))
        let B = B.min + ((B.max <= B.min) ? 0 : Int(arc4random() % UInt32(min(B.max, 255) - max(B.min, 0))))
        let A = A.min + ((A.max <= A.min) ? 0 : Int(arc4random() % UInt32(min(A.max, 100) - max(A.min, 0))))
        return UIColor.init(red: CGFloat(R) / 255.0, green: CGFloat(G) / 255.0, blue: CGFloat(B) / 255.0, alpha: CGFloat(A) / 100.0)
    }
    
    /// ** HEX 常规模式 **
    /// - Parameters:
    ///   - H: HEX 数值 000000 ~ FFFFFF
    ///   - A: 透明 数值 0 ~ 100
    /// - Returns: 颜色对象
    public class func HEX(H: String, A: CGFloat = 1.0) -> UIColor {
        var C = 0 as UInt64
        let _ = Scanner(string: H).scanHexInt64(&C)
        let M = 0x000000FF
        let R = Int(C >> 16) & M
        let G = Int(C >> 08) & M
        let B = Int(C >> 00) & M
        return UIColor.init(red: CGFloat(R) / 255.0, green: CGFloat(G) / 255.0, blue: CGFloat(B) / 255.0, alpha: A)
    }

    /// ** HEX 特征模式 **
    /// - Parameters:
    ///   - LH: 明亮 模式 HEX 数值 000000 ~ FFFFFF
    ///   - LA: 明亮 模式 透明 数值 0 ~ 100
    ///   - DH: 暗黑 模式 HEX 数值 000000 ~ FFFFFF
    ///   - DA: 暗黑 模式 透明 数值 0 ~ 100
    /// - Returns: 颜色对象
    public class func traitHEX(LH: String, LA: CGFloat = 1.0, DH: String, DA: CGFloat = 1.0) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return UIColor.HEX(H: DH, A: DA)
                default:
                    return UIColor.HEX(H: LH, A: LA)
                }
            }
        } else {
            return UIColor.HEX(H: LH, A: LA)
        }
    }
}
