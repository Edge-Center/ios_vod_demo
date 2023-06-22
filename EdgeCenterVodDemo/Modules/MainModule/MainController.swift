import UIKit

final class MainController: UITabBarController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        
        let strokeView = UIView()
        strokeView.translatesAutoresizingMaskIntoConstraints = false
        strokeView.backgroundColor = .grey800
        tabBar.addSubview(strokeView)
        tabBar.tintColor = .blue
        
        NSLayoutConstraint.activate([
            strokeView.widthAnchor.constraint(equalToConstant: ScreenSize.width),
            strokeView.heightAnchor.constraint(equalToConstant: 1),
            strokeView.topAnchor.constraint(equalTo: tabBar.topAnchor),
        ])
        
        let viewingVC = ViewingController()
        viewingVC.tabBarItem = .init(
            title: "VODs",
            image: .viewingIcon, 
            selectedImage: .viewingSelectedIcon.withRenderingMode(.alwaysOriginal)
        )
        
        let uploadVC = UploadController()
        uploadVC.tabBarItem = .init(
            title: "Upload",
            image: .uploadIcon, 
            selectedImage: .uploadSelectedIcon.withRenderingMode(.alwaysOriginal)
        )
        
        let profileVC = ProfileController()
        profileVC.tabBarItem = .init(
            title: "Account",
            image: .accountIcon, 
            selectedImage: .accountSelectedIcon.withRenderingMode(.alwaysOriginal)
        )
        
        let smoothScrollVC = SmoothScrollingController()
        smoothScrollVC.tabBarItem = .init(
            title: "Viewing",
            image: .smoothScrollingIcon,
            selectedImage: .smoothScrollingIconSelected.withRenderingMode(.alwaysOriginal)
        )

        viewControllers = [viewingVC, smoothScrollVC ,uploadVC, profileVC]
    }   
}
