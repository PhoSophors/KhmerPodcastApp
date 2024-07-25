import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        setupTabBar()
    }

    private func setupTabBar() {
        // Create tab bar controller
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.unselectedItemTintColor = .gray
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.layer.cornerRadius = 25
        tabBarController.tabBar.layer.masksToBounds = true
        tabBarController.tabBar.layer.borderWidth = 1
        tabBarController.tabBar.layer.borderColor = UIColor.white.cgColor

        let homeVC = HomeViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        
        let searchVC = SearchViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        let searchNavVC = UINavigationController(rootViewController: searchVC)
        
        let createVC = CreateViewController()
        createVC.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "plus.app"), selectedImage: UIImage(systemName: "plus.app.fill"))
        let createNavVC = UINavigationController(rootViewController: createVC)
        
        let favVC = FavoritesViewController()
        favVC.tabBarItem = UITabBarItem(title: "Likes", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        let favNavVC = UINavigationController(rootViewController: favVC)

        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        
        // Assign view controllers to the tab bar controller
        tabBarController.viewControllers = [homeNavVC, searchNavVC, createVC, favNavVC, profileNavVC]
        
        // Set tab bar controller as the child of MainViewController
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
        
        tabBarController.view.frame = view.bounds

        // Customize selected tab appearance
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white

            let itemAppearance = UITabBarItemAppearance()
            itemAppearance.selected.iconColor = .systemBlue
            itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
            itemAppearance.normal.iconColor = .gray
            itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

            appearance.stackedLayoutAppearance = itemAppearance
            appearance.inlineLayoutAppearance = itemAppearance
            appearance.compactInlineLayoutAppearance = itemAppearance

            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
    }

//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        // Adjust the height of the tab bar
//        guard let tabBar = self.children.first?.view else { return }
//        var tabBarFrame = tabBar.frame
//        tabBarFrame.size.height = 80
//        tabBarFrame.origin.y = self.view.frame.size.height - 80
//        tabBar.frame = tabBarFrame
//    }
}
