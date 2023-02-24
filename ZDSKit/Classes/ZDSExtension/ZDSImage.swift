import UIKit

extension UIImage {
    
    /// 获取图片中指定坐标色值
    /// - Parameter point: 图片中指定坐标
    /// - Returns: 坐标色值
    public func colorFromPoint(_ point: CGPoint) -> UIColor? {
        
        if point.x < 0 { return nil }
        if point.y < 0 { return nil }
        if point.x > size.width { return nil }
        if point.y > size.height { return nil }
        
        guard let cgImage = cgImage else { return nil }
        guard let dataProvider = cgImage.dataProvider else { return nil }
        guard let data = dataProvider.data else { return nil }
        guard let byte = CFDataGetBytePtr(data) else { return nil }

        let i = Int(((size.width * point.y) + point.x) * 4)

        var rgba: [Int] = []
        switch cgImage.bitmapInfo.rawValue {
        case 1:
            rgba = [0,1,2,3]
        default:
            rgba = [2,1,0,3]
        }
        
        let r = CGFloat(byte[i + rgba[0]]) / CGFloat(255.0)
        let g = CGFloat(byte[i + rgba[1]]) / CGFloat(255.0)
        let b = CGFloat(byte[i + rgba[2]]) / CGFloat(255.0)
        let a = CGFloat(byte[i + rgba[3]]) / CGFloat(255.0)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
