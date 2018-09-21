//
//  Utility.swift

import UIKit
import Foundation


// MARK: - Colors
extension UIColor {
    class func defaultBlue() -> UIColor { return UIColor(r: 71, g: 122, b: 164) }
    class func lightBorder() -> UIColor { return UIColor(r: 204, g: 204, b: 204) }
    class func lightBlueViewBG() -> UIColor { return UIColor(r: 227, g: 238, b: 254) }
    class func defaultTheme() -> UIColor { return UIColor(r: 236, g: 42, b: 96) }
    
    class func themeMenu() -> UIColor { return UIColor(r: 50, g: 50, b: 50) }
    class func black() -> UIColor { return UIColor.black }
    class func white() -> UIColor { return UIColor.white }
    class func lightGray() -> UIColor { return UIColor.lightGray }
    class func gray() -> UIColor { return UIColor.gray }
    class func darkGray() -> UIColor { return UIColor.darkGray }
    class func red() -> UIColor { return UIColor.red }
    class func clear() -> UIColor { return UIColor.clear }
}
//enum Color {
//    static let defaultBlue = UIColor(r: 71, g: 122, b: 164)
//    static let lightBorder = UIColor(r: 204, g: 204, b: 204)
//    static let lightBlueViewBG = UIColor(r: 227, g: 238, b: 254)
//    
//    static let black = UIColor.black
//    static let white = UIColor.white
//    static let lightGray = UIColor.lightGray
//    static let gray = UIColor.gray
//    static let darkGray = UIColor.darkGray
//    static let red = UIColor.red
//    static let clear = UIColor.clear
//}

// MARK: - Font Name
enum Font {
    static let openSansRegular       = "OpenSans"
    static let openSansBold          = "OpenSans-Bold"
    static let openSansSemibold      = "OpenSans-Semibold"
    static let latoBold              = "Lato-Bold"
}


//enum StoryBoardID {
//    static let CreateProjectVC = "CreateProjectVC"
//    static let AllProjectsVC = "AllProjectsVC"
//    static let RegistrationScreenVC = "RegistrationScreenVC"
//    static let TempNavigationVC = "TempNavigationVC"
//
//    static let CreatePostVC = "CreatePostVC"
//    static let CreateToDoVC = "CreateToDoVC"
//
//    static let ChatVC = "ChatVC"
//
//
//
//    static let CoinbidzTabBarController        = "CoinbidzTabBarController"
//    static let SlideMenuVC                     = "SlideMenuVC"
//    static let AuctionSitScreenVC              = "AuctionSitScreenVC"
//    static let WebAuctionSitScreenVC           = "WebAuctionSitScreenVC"
//    static let CoinCamScreenVC                 = "CoinCamScreenVC"
//    static let HomeScreenVC                    = "HomeScreenVC"
//    static let HomeTablePickerValueScreenVC    = "HomeTablePickerValueScreenVC"
//    static let HomeSearchScreenVC              = "HomeSearchScreenVC"
//    static let NewQuoteScreenVC                = "NewQuoteScreenVC"
//    static let QuoteSearchScreenVC             = "QuoteSearchScreenVC"
//    static let QuoteDetailScreenVC             = "QuoteDetailScreenVC"
//    static let EmailQuoteScreenVC              = "EmailQuoteScreenVC"
//    static let ItemDetailScreenVC              = "ItemDetailScreenVC"
//    static let SellOnRoundTableScreenVC        = "SellOnRoundTableScreenVC"
//    //
//    // cell Identifier's
//    static let SlideMenuCell               = "SlideMenuCell"
//    static let QuoteSearchTableViewCell    = "QuoteSearchTableViewCell"
//    static let QuoteDetailTableViewCell    = "QuoteDetailTableViewCell"
//}
// MARK: - Titles
enum Title {
    static let coinCam           = "COIN CAM"
    static let ebay              = "EBAY"
    static let newQuote          = "NEW QUOTE"
    static let quoteSearch       = "QUOTE SEARCH"
    static let quoteDetails      = "QUOTE DETAILS"
    static let itemDetails       = "ITEM DETAILS"
    static let sellOnRT          = "SELL ON ROUNDTABLE"
}

enum ChatNotificationCenter {
    static let newMessage   = "newMessageNotificationCenter"
    static let newGroup   = "newGroupNotificationCenter"
    static let removeFromGroup   = "removeFromGroupNotificationCenter"
    
}

enum Placeholder {
    static let searchByKeyword   = "Search by Keyword or PCGS#"
}



enum WebApi {
    
    //    static let mainURL = "http://198.58.98.34:5200/api"
    static let mainURL = "http://198.58.98.34:5200/api"
    static let RegisterURL = mainURL + "/register"
    static let LoginURL = mainURL + "/login"
    
    //Project Module
    static let CreateProjectURL = mainURL + "/create-project"
    static let InviteUserURL = mainURL + "/invite-user"
    static let AllProjects = mainURL + "/project"//:type - For Project List type = 0 and for Team List type = 1
    static let RenameProjectURL = mainURL + "/rename-project"
    static let ProjectDetail = mainURL + "/project-detail"//:id
    static let ProjectUsersListURL = mainURL + "/project-users-list/"
    
    //Post Module
    static let CreatePost = mainURL + "/post/discussion/create"
    static let UpdatePost = mainURL + "/post/update"
    static let DeletePost = mainURL + "/post/delete"
    static let PostList = mainURL + "/posts"
    static let PostUserList = mainURL + "/post/user/"
    static let PostToDoListWithTask = mainURL + "/post/todo"
    
    //To-Do Module
    static let CreateToDo = mainURL + "/post/todo/create"
    
    //Task Module
    static let CreateTask = mainURL + "/task/create"
    static let TaskDetails = mainURL + "/task"
    static let TaskList = mainURL + "/tasks"
    static let UpdateTaskStatus = mainURL + "/task/status"
    static let UpdateTask = mainURL + "/task/update"
    
    //Comment Module
    static let CommentList = mainURL + "/comments"
    static let CreateComment = mainURL + "/comment/create"
    static let DeleteComment = mainURL + "/comment/delete/"
    static let UpdateComment = mainURL + "/comment/update"
    
    //User Module
    static let GetUsers = mainURL + "/users"
    static let UserDetails = mainURL + "/user"//:id
    
    
    //Chat Module
    static let CreateGroupChat = mainURL + "/chat-group/create"
    static let GroupChatDetail = mainURL + "/chat-group"
    static let GroupChatList = mainURL + "/chat-groups"
    static let UpdateGroupChat = mainURL + "/chat-group/update"
    static let GroupChatAddUser = mainURL + "/chat-group/user/add"
    static let GroupChatRemoveUser = mainURL + "/chat-group/user/remove"
    
    static let GetChatMessages = mainURL + "/chat/messages"
    static let SendChatMessage = mainURL + "/chat/send/message"
    static let ReadChatMessage = mainURL + "/chat/mark/read"
    
    
}


struct Constants {
    // MARK: - Global Utility
    static let appName    = Bundle.main.infoDictionary!["CFBundleName"] as! String
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    struct GlobalConstants {
        static let appName    = Bundle.main.infoDictionary!["CFBundleName"] as! String
        static let appDelegate = UIApplication.shared.delegate as! AppDelegate
        static let Login                = "Login"
        static let LoginStoryboard = UIStoryboard(name: "Login", bundle: nil)
        static let RegistrationStoryboard = UIStoryboard(name: "Registration", bundle: nil)
        
        static let WelcomeStoryboard = UIStoryboard(name: "Welcome", bundle: nil)
        
        static let sideMenuStoryboard = UIStoryboard(name: "Sidemenu", bundle: nil)
        static let ProductListStoryboard = UIStoryboard(name: "ProductList", bundle: nil)
        static let CategoryStoryboard = UIStoryboard(name: "Category", bundle: nil)
        static let AddToCartStoryboard = UIStoryboard(name: "AddToCart", bundle: nil)
        static let TakeTourStoryboard = UIStoryboard(name: "TakeTour", bundle: nil)
        static let ForgotPasswordStoryboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        static let ChangePasswordStoryboard = UIStoryboard(name: "ChangePassword", bundle: nil)
        static let ProfileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        static let AccountStoryboard = UIStoryboard(name: "Account", bundle: nil)
        static let WishlistStoryboard = UIStoryboard(name: "Wishlist", bundle: nil)
        static let ProductDetailStoryboard = UIStoryboard(name: "ProductDetail", bundle: nil)
        static let SearchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        static let FilterStoryboard = UIStoryboard(name: "Filter", bundle: nil)
        static let CheckoutStoryboard = UIStoryboard(name: "Checkout", bundle: nil)
        static let MyOrdersStoryboard = UIStoryboard(name: "MyOrders", bundle: nil)
        static let NotificationStoryboard = UIStoryboard(name: "Notification", bundle: nil)
        static let AddressListStoryboard = UIStoryboard(name: "AddressList", bundle: nil)
        static let Address = UIStoryboard(name: "Address", bundle: nil)
        static let SettingsStoryboard = UIStoryboard(name: "Settings", bundle: nil)
    }
    
    // MARK: - StoryBoard Identifier's
    
    struct StoryBoardID{
        static let kAddAndEditAddressVC1ID = "AddAndEditAddressVC1"
        static let kWelcomeVC1ID = "WelcomeVC1"
        static let kLoginVC1ID = "LoginVC1"
        static let kRegistrationVC1ID = "RegistrationVC1"
        static let kSidemenuID = "SideMenuVC1"
        static let kDashboardID = "DashboardVC"
        static let kCategoryVC1ID = "CategoryVC1"
        static let kChangePasswordVC1ID =  "ChangePasswordVC1"
        static let kMyOrderVC1ID = "MyOrdersVC1"
        static let kNotificationVC1ID = "NotificationVC1"
        static let kProfileVC1ID = "ProfileVC1"
        static let kWishlistVC1ID = "WishlistVC1"
        static let kForgotPasswordVC1ID = "ForgotPasswordVC1"
        static let kTakeATourVC1ID = "TakeATourVC1"
        static let kAccountVC1ID = "AccountVC1"
        static let kProductListVC1ID = "ProductListVC1"
        static let kProductDetailVC1ID = "ProductDetailVC1"
        static let kAddToCartVC1ID = "AddToCartVC1"
        static let kSearchVC1ID = "SearchVC1"
        static let kFilterVC1ID = "FilterVC1"
        static let kCheckoutVC1ID = "CheckoutVC1"
        static let kAddressListVC1ID = "AddressListVC1"
        static let kSettingsScreenVCID = "SettingsVC1"
    }
    // MARK: - Color Codes
    
    struct RGBColorCodes {
        static let cNavigationBarColor = UIColor.init(red: 2.0/255.0, green: 83.0/255.0, blue: 163.0/255.0, alpha: 1.0)
        static let cTopBarSelectedBackgroundColor = UIColor.init(red: 0.0/255.0, green: 42.0/255.0, blue: 86.0/255.0, alpha: 1.0)
        static let defaultBlueColor = UIColor.init(red: 71.0/255.0, green: 122.0/255.0, blue: 164.0/255.0, alpha: 1.0)
        static let defaultGrayColor = UIColor.init(red: 136.0/255.0, green: 136.0/255.0, blue: 136.0/255.0, alpha: 1.0)
        static let darkGrayColorText = UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        static let sideMenuSecondTextColor = UIColor.init(red: 38/255.0, green: 81/255.0, blue: 168/255.0, alpha: 1.0)
        static let otherEventColor = UIColor.init(red: 183/255, green: 217/255, blue: 254/255, alpha: 1)
        static let roundTableEventColor = UIColor.init(red: 48/255, green: 103/255, blue: 254/255, alpha: 1)
        static let cursorTintColor = UIColor.init(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        static let screenBGColor = UIColor(red: 242.0/255.0, green: 246.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        static let activeColor = UIColor(red: 40.0/255.0, green: 160.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        static let soldColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        static let gradientBlue = UIColor(red: 18.0/255.0, green: 99.0/255.0, blue: 165.0/255.0, alpha: 1.0)
        static let gradientLightBlue = UIColor(red: 85.0/255.0, green: 148.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        static let defaultRedColor = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        static let blackColor = UIColor.black
        static let whiteColor = UIColor.white
        static let lightGrayColor = UIColor.lightGray
        static let grayColor = UIColor.gray
        static let darkGrayColor = UIColor.darkGray
        static let redColor = UIColor.red
        static let clearColor = UIColor.clear
        
    }
    
    //MARK: - device type
    
    enum UIUserInterfaceIdiom : Int{
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        //  static let IS_IPADMin             = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        static let IS_IPADMin              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1112.0
        static let IS_IPADLarge              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    }
    
    // MARK: - NavigationBar Titles
    
    struct navigationBarTitle {
        static let kSignUP = "SIGN UP"
        static let kLogin = "LOGIN"
        static let kProfile = "PROFILE"
        static let kHome = "HOME"
        static let kShop = "SHOP"
        static let kCategories = "CATEGORIES"
        static let kChangePassword = "CHANGE PASSWORD"
        static let kMyAccount = "MY ACCOUNT"
        static let kShoppingCart = "CART"
        static let kSearch = "SEARCH"
        static let kFilter = "FILTER"
        static let kOrders = "ORDERS"
        static let kNotification = "NOTIFICATIONS"
        static let kCheckout = "CHECKOUT"
        static let kWishlist = "WISHLIST"
        static let kForgotPassword = "FORGOT PASSWORD"
        static let kProductList = "PRODUCT LIST"
        static let kProductDetail = "PRODUCT DETAIL"
        static let kAddress = "ADDRESS"
        static let kMyAddress = "MY ADDRESS"
        static let updateAddress = "UPDATE ADDRESS"
        static let kSettings = "SETTINGS"
    }
    struct DateFormat
    {
        static let date = "dd/MM/yy"
        static let time = "hh:mm a"
    }
    
    struct WebServiceParameter {
        static let pEmailID = "email"
        static let pPassword = "pass"
        static let paramNewPassword = "password"
        static let pUserID = "userid"
        static let pAPIKEY = "api_key"
        static let pFname = "fname"
        static let pLname = "lname"
        static let pProd_id = "prod_id"
        static let pSearchKey = "search_key"
        //Add To Cart
        static let pCountry = "country"
        static let pZipcode = "zipcode"
        static let pAddressID = "address_id"
        static let pFlag = "flag"
        static let pQty = "qty"
        static let pProdID = "prodid"
        //ProductList
        static let pCatId = "catid"
        static let pPage = "page"
        static let pLimit = "limit"
        static let pData = "data"
        static let pfirstname = "firstname"
        static let plastname = "lastname"
        static let pStreetline1 = "streetline1"
        static let pStreetline2 = "streetline2"
        static let pCity = "city"
        static let pCountryId = "country_id"
        static let pRegion = "region"
        static let pRegionId = "region_id"
        static let pPostcode = "postcode"
        static let pTelephone = "telephone"
        static let pMobile = "mobile"
        static let pCompany = "company"
        
        
        static let pProjectName = "name"
        static let pType = "type"
        static let pID = "id"
        static let pInvitedUser = "inviteduser"
        static let pLoginUser = "login_user"
        static let pStatus = "status"
        
        //To-Do
        static let pProjectID = "project_id"
        static let pToDoSubject = "subject"
        
        //Post
        static let pPrivate = "private"
        static let pAllusers = "allusers"
        static let pUsers = "users"
        static let pFiles = "files"
        static let pPostSubject = "subject"
        static let pMessage = "message"
        static let pCommentId = "comment_id"
        static let pDeletedFiles = "deleted_files"
        static let pPostType = "post_type"
        static let pSortDate = "sort_date"
        //        static let pPage = "page"
        //        static let pLimit = "limit"
        
        //Task
        static let pPostID = "post_id"
        static let pTitle = "title"
        static let pAssignToID = "assign_to_id"
        static let pStartDate = "start_date"
        static let pEndDate = "end_date"
        
        //Comment
        static let pTaskId = "task_id"
        static let pNewUsers = "new_users"
        
        //Chat
        static let pGroupId = "group_id"
        static let pRemoveUsers = "remove_users"
        static let pGroupPic = "group_pic"
        static let pDate = "date"
        static let pOrderBy = "order_by"
        
        
    }
    
    // MARK: - User Default KeyName
    struct UserDefault {
        static let kApiToken = "kApiToken"
        static let kUserID = "user_id"
        static let kLoginUserData = "kLoginUserData"
        static let kUsername = "user_name"
        static let kEmail = "email"
        static let kPass = "pass"
    }
    
    
    
    struct WebServiceURL {
        static let API_KEY = "ICXE1wOphgKgcyMoHr0hVHbbJ"
        // static let mainURL = "http://192.168.15.162/zapstore-ethan/web2/"
        static let mainURL = "http://202.131.115.108/zapstore/web2/"
        static let SignUpURL = mainURL + "customerRegistration.php"
        static let LogInURL = mainURL + "customerLogin.php"
        static let CategoryURL = mainURL + "allCategory.php"
        static let ProductDetailsURL = mainURL + "productDetails.php"
        static let CheckoutURL = mainURL + "customerCart.php"
        static let AddRemoveCartURL = mainURL + "cartActions.php"
        static let AddRemoveWishlistURL = mainURL + "wishlistActions.php"
        static let SearchURL = mainURL + "searchCatalog.php"
        static let ProductListURL = mainURL + "categoryAssignedProdList.php"
        static let ForgotPasswordURL = mainURL + "/forgetPassword.php"
        static let CompaniesListURL = mainURL + "/companies"
        static let DiscussionListURL = mainURL + "/posts"
        static let AddDiscussionPostURL = mainURL + "/post/add"
        static let AddCommentOnPostURL = mainURL + "/post/comment/add"
        static let LikePostURL = mainURL + "/post/like"
        static let AllCommentsURL = mainURL + "/post/comments/"
        static let AllLikesURL = mainURL + "/post/likes/"
        static let ContactUsURL = mainURL + "/contact-us"
        static let CreateEventURL = mainURL + "/auction/event/add"
        static let AllEventsURL = mainURL + "/auction/events"
        static let AddCommentOnAuctionURL = mainURL + "/auction/comment/add"
        static let AllAuctionCommentsURL = mainURL + "/auction/comments/"
        static let ItemAttributesURL = mainURL + "/item/attributes/"
        static let AddItemURL = mainURL + "/item/add"
        static let mobileCmsPagesURL = mainURL + "mobileCmsPages.php"
        static let mobileBannersURL = mainURL + "mobileBanners.php"
        static let mobileMenuURL = mainURL + "mobileMenu.php"
        static let customerOrderHistoryListURL = mainURL + "customerOrderHistoryList.php"
        static let customerCartURL = mainURL + "customerCart.php"
        static let customerWishlistURL = mainURL + "customerWishlist.php"
        static let changePasswordURL = mainURL + "changePassword.php"
        static let customerAddressListURL = mainURL + "customerAddressList.php"
        static let customerAddressCreateURL = mainURL + "customerAddressCreate.php"
        static let customerAddressUpdateURL = mainURL + "customerAddressUpdate.php"
        static let customerAddressDeleteURL = mainURL + "customerAddressDelete.php"
        static let couponActionsURL = mainURL + "couponActions.php"
        static let allNotificationsURL = mainURL + "allNotifications.php"
        static let UserProfileURL = mainURL + "customerInfo.php"
        static let EditProfileURL = mainURL + "customerInfoUpdate.php"
        static let CountryListURL = mainURL + "countryList.php"
        static let RegionListURL = mainURL + "regionList.php"
    }
    // MARK: - Alert Messages
    
    struct AlertMessage{
        static let noResult = "No Result Found"
        static let inProgress = "In Progress"
        static let NetworkConnection  = "You are not connected to internet. Please connect and try again"
        static let networkConnection = "You are not connected to internet. Please connect and try again"
        static let msgSlowNetworkConnection = "We are unable to retrieve the data at this time, please try again"
        static let contactUs = "Your query has been submitted successfully"
        
        static let cameraPermission = "Please enable camera access from Privacy Settings"
        static let photoLibraryPermission = "Please enable access for photos from Privacy Settings"
        static let noCamera = "Device Has No Camera"
        
        static let comingSoon = "Coming Soon"
        static let noConnectedUsers = "No Connected Users"
        static let noTeamsAdded = "No Teams Added"
        static let name = "Please enter name"
        static let nameCharacter = "Name must contain atleast 3 characters and maximum 50 characters"
        static let validName = "Please enter valid  name"
        static let zipcode = "Please enter zipcode"
        static let bussinessName = "Please enter bussiness name"
        static let comments = "Please enter comments"
        static let fullName = "Please enter full name"
        static let firstName = "Please enter first name"
        static let lastName = "Please enter last name"
        static let validEmail = "Please enter valid email"
        static let address = "Please enter address"
        static let city = "Please enter city"
        static let state = "Please select state"
        static let zipCode = "Please enter zip code"
        static let selectCountry = "Please select Country"
        static let country = "Please enter country"
        static let email = "Please enter email"
        static let username = "Please enter username"
        static let password = "Please enter password"
        static let oldPassword = "Please enter old password"
        static let newPassword = "Please enter new password"
        static let confirmPassword = "Please enter confirm password"
        static let otp = "Please enter OTP"
        static let SamePassword = "New password and Confirm password should be same"
        static let passwordCharacter = "Password must contain atleast 8 characters and maximum 15 characters"
        static let validPassword = "Password should contain atleast one uppercase letter, one lowercase letter, one digit and one special character with minimum eight character length."
        static let spacePassword = "Please remove whitespace from password"
        static let phone = "Please enter phone number"
        static let phoneCharacter = "Phone number must contain atleast 8 digits and maximum 15 digits"
        static let validPhone = "Phone number should be in digit only"
        static let companyTitle = "Please enter company title"
        static let companyName = "Please select company name"
        static let companyNameCharacter = "Company name should have atleast four characters"
        static let newDiscussion = "Please enter description"
        static let postComment = "Please enter comment"
        static let eventImage = "Image is required"
        static let eventName = "Please enter event name"
        static let startDate = "Please enter start date"
        static let startTime = "Please enter start time"
        static let endDate = "Please enter end date"
        static let endTime = "Please enter end time"
        static let location = "Please select your location"
        static let details = "Please enter details"
        static let noConnection = "No Connection Found"
        static let noteams = "No Teams Selected"
        //Webservice Fail Message
        static let error = "Something went wrong. Please try after sometime"
        
        //No Data Found Messages
        static let noLike  = "Sorry! There is no like on this post"
        static let noComment = "Sorry! There is no comment on this post"
        
        //Camera, Images and ALbums Related Messages
        static let msgPhotoLibraryPermission = "Please enable access for photos from Privacy Settings"
        static let msgCameraPermission = "Please enable camera access from Privacy Settings"
        static let msgNoCamera = "Device Has No Camera"
        static let msgLogout = "Do you want to logout?"
        static let msgConfirm = "Please Confirm!"
        static let deleteConnectecion = "Do you want to delete your connection?"
        static let msgRemove = "Remove Item"
        static let msgRemoveAddress = "Remove Address"
        static let removeItem = "Are you sure you want to remove this item?"
        static let removeAddress = "Are you sure you want to remove this address?"
    }
}
