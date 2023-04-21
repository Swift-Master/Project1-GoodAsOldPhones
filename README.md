## 프로젝트 1 : GoodAsOldPhones

### 1st Commit
#### 날짜 : 2023.04.15

#### 구현사항
- Model, View, ViewController 그룹 생성
- 뷰컨트롤러끼리 주고받을 데이터를 저장하는 Product 구조체 Model에 생성
- SceneDelegate 클래스에 UITabBarController 구현 및 UINavigationController 설정
- 테이블뷰의 세부사항을 구현할 CustomTableViewCell 클래스 구현
    - 다음 화면 이동을 위한 `disclosureIndicator` 악세서리 뷰 및구현
    - 제품 이미지,제품이름 객체 구현
- 제품목록이 나열되어 있는 ProductViewController 구현
    - 테이블 뷰 구현 및 다음화면 이동 로직 구현
    - 표시 데이터 배열 구현
    - 테이블 뷰의 헤더뷰 구현

### 2nd Commit
#### 날짜 : 2023.04.17

#### 구현사항
- ProductDetailViewController 구현
    - 커스텀 프로토콜 및 Delegate패턴을 통해 이전 뷰컨트롤러의 데이터 수신 로직 구현
    - 수신 데이터 기반 이미지를 superView의 배경으로 적용
    - 구매 버튼 구현 및 문구 출력 로직 구현

### 3rd Commit
#### 날짜 : 2023.04.19

#### 구현사항
- ContactViewController 구현
    - UI 객체 메서드 구현 및 UI 객체간 레이아웃 구현
    - 스크롤뷰 구현

### 실행화면
![실행화면](https://user-images.githubusercontent.com/116094622/233558295-97b16b42-fbc7-4814-ba8a-dd365cd7d9c3.gif)

