## 프로젝트 1 : GoodAsOldPhones

UITabBarController, UINavigationController, UIScrollView, UITableView를 연습해보는 앱입니다.

이 앱의 레퍼런스는 [soapyigu의 Swift-30-Projects](https://github.com/soapyigu/Swift-30-Projects/tree/master/Project%2001%20-%20GoodAsOldPhones)입니다.

기본 기능을 모두 구현했다면, 디자인 및 추가 기능 구현은 자유롭게 해주세요.

## 실제 화면
![GoodAsOldPhones](./GoodAsOldPhones.gif)

---
### DEV_1 Branch
#### 2023.04.19.
- TabBarController를 이용해 메인이 되는 Products 화면과 Us(AboutUs) 화면 분리
- Us 화면 구현
    - ScrollView 안에 UIView를 배치하고 UIView 안에 화면에 필요한 View 배치
    - 내부에 배치한 서브뷰들은 제약에 신경써서 작업하진 않았습니다.

#### 2023.04.20.
- Products 화면 구현
    - TableView와 TableViewCell을 이용하여 화면 구성
    - TableView Section 설정으로 레퍼런스와 같은 위, 아래 공백 생성
- NavigationController
    - Products 화면에서 TableCell을 눌렀을 때 Detail 화면 이동

### 구현 화면
<img src="./GoodAsOldPhone-DEV_1.gif" width="400" height="600"/>
