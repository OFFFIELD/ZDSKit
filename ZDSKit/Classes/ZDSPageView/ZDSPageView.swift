import UIKit

public protocol ZDSPageViewDelegate: NSObjectProtocol {

    /// 滚动停止响应
    /// - Parameters:
    ///   - pageView: 对象本体
    ///   - index: 当前页
    ///   - count: 总页数
    func pageView(_ pageView: ZDSPageView, current index: Int, total count: Int)

    
    /// 滚动过程监听
    /// - Parameters:
    ///   - pageView: 对象本体
    ///   - progress: 滚动幅度 正数向右 负数向左
    
    func pageView(_ pageView: ZDSPageView, progress: CGFloat)
}

public class ZDSPageView: UIView {
    
    public weak var delegate: ZDSPageViewDelegate?
    
    //是否循环滚动
    public var isLoopEnabled = false
    
    //当前显示页
    public var selectedIndex: Int? {
        set {
            guard let selectedIndex = newValue else { return }
            setSelectedIndex(selectedIndex, animated: false)
        }
        get {
            guard let pageViewControllers = pageViewController.viewControllers else { return nil }
            guard let firstController = pageViewControllers.first else { return nil }
            guard let viewControllers = viewControllers else { return nil }
            return viewControllers.firstIndex(of: firstController)
        }
    }
    
    //内容控制器
    public var viewControllers: [UIViewController]? {
        didSet {
            guard let viewControllers = viewControllers else { return }
            guard let firstController = viewControllers.first else { return }
            pageViewController.setViewControllers([firstController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    //控制器绑定
    public var parentController: UIViewController? {
        didSet {
            guard let parentController = parentController else { return }
            parentController.addChild(pageViewController)
        }
    }
   
    //翻页控制器
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: [.interPageSpacing: 0])

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initPageViewController()
    }

    //初始化本体
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initPageViewController()
    }
    
    //初始化翻页控制器
    private func initPageViewController() {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.view.frame = bounds
        addSubview(pageViewController.view)
        
        for view in pageViewController.view.subviews {
            if let scroll = view as? UIScrollView {
                scroll.delegate = self
                break
            }
        }
    }
    
    /// 滚动控制
    /// - Parameters:
    ///   - index: 目标页
    ///   - animated: 是否需要动画
    public func setSelectedIndex(_ index: Int, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        /// 视图控制数据不全禁止滚动
        guard let viewControllers = viewControllers else { return }
        guard let pageViewControllers = pageViewController.viewControllers else { return }
        guard let firstController = pageViewControllers.first else { return }
        guard let currentIndex = viewControllers.firstIndex(of: firstController) else { return }
        guard viewControllers.count > index else { return }
        /// 判断滚动方向
        var direction: UIPageViewController.NavigationDirection = .forward
        if index < currentIndex && index != 0 {
            direction = .reverse
        }
        /// 设置滚动结果
        let indexController = viewControllers[index]
        pageViewController.setViewControllers([indexController], direction: direction, animated: animated, completion: completion)
    }
    
    /// 是否准备好滚动
    /// - Returns: 结果
    public func isReadyToScroll() -> Bool {
        /// 程序处于非活状态禁止滚动
        guard UIApplication.shared.applicationState == .active else { return false }
        /// 视图处于隐藏状态禁止滚动
        guard isHidden == false else { return false }
        /// 视图处于非视界内禁止滚动
        guard window != nil else { return false }
        /// 视图已准备好滚动
        return true
    }
}

extension ZDSPageView: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = viewControllers else { return nil }
        guard viewControllers.count > 1 else { return nil }
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        if isLoopEnabled {
            guard index > 0 else { return viewControllers.last }
        } else {
            guard index > 0 else { return nil }
        }
        return viewControllers[index - 1]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = viewControllers else { return nil }
        guard viewControllers.count > 1 else { return nil }
        guard let index = viewControllers.firstIndex(of: viewController) else { return nil }
        if isLoopEnabled {
            guard index < viewControllers.count - 1 else { return viewControllers.first }
        } else {
            guard index < viewControllers.count - 1 else { return nil }
        }
        return viewControllers[index + 1]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard finished == true else { return }
        guard completed == true else { return }
        guard let delegate = delegate else { return }
        guard let viewControllers = viewControllers else { return }
        guard let index = selectedIndex else { return }
        delegate.pageView(self, current: index, total: viewControllers.count)
    }
}

extension ZDSPageView: UIScrollViewDelegate {
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let delegate = delegate else { return }
        let progress = (scrollView.contentOffset.x - .screenWidth) / .screenWidth
        delegate.pageView(self, progress: progress)
    }
}
