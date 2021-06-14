# SOPT 28기 iOS 1차 세미나

## Cocoa Framework

> 애플에서 만든 맥용 어플리케이션을 만들 때 사용하는 프레임워크  
> UIKit, Foundation, CoreData, MapKit, CoreAnimation... 등등

## H.I.G

> Human Interface Guide

**iOS의 3가지 핵심 가치(주제)**

* Clarity 명확함
  * 가독성 높은 테스트, 이해하기 쉬운 아이콘, 최소화된 장식,
  * 기능 주도의 디자인, 중요한 요소들의 강조
* Deference 존중
  * 전체를 활용한 컨텐츠 표시
  * 메인 컨텐츠 이외의 다른 요소가 부각되지 않도록
  * 베젤, 그라데이션의 활용
  * 그림자 사용 최소화, 밝은 인터페이스 유지
* Depth 깊이
  * 레이어와 모션을 활용해 계층을 표현
  * 컨텐츠를 이동할 때 깊이감을 더해주도록 화면 전환
  * 터치 및 검색 기능으로 컨텐츠에 쉽게 접근

**HIG의 디자인 6원칙**

* Aesthetic Integrity 심미적 통일
  * 앱의 모양, 동작이 기능과 얼마나 잘 통합되어 있는가
* Consistency 일관성
  * 아이콘, 표준 텍스트 스타일, 통일된 용어들을 사용한 익숙한 표준 및 패러다임 구현
* Direct Manipulation 직접 조작
  * 장치 회전, 제스처 사용 등과 같은 직접 컨텐츠 조작을 통한 사용자의 이해도 향상
* Feedback 피드백
  * 사용자가 발생시킨 동작에 대해 그래픽, 사운드를 통한 작업결과 표시
* Metaphors 비유
  * 사용자들이 친숙하게 느낄만 한 비유를 통해 이해를 도움
* Use Control 사용자 컨트롤
  * 중요한 작업은 사용자가 직접 결정하여 동작하도록 함

## HIG 내용 살펴보기 (일부)

### Controls

> 사용자의 입력을 받거나, 부수적인 정보를 표시하는 요소들

**Label**

* 사용자가 수정 불가, 복사 가능
* **Dynamic type**을 사용하면  
  사용자가 기기 설정에서 텍스트 크기를 변경하는 경우에도 잘 보이게 할 수 있음

**Button**

4가지의 지정된 버튼 스타일

* System Buttons
  * 네비게이션 바 / 어디서든 사용할 수 있는 형태
  * 동사(영어 기준) 권장
* Detail Disclosure Button
  * 주로 Tables에서 해당 행의 세부정보를 보여주기 위해 사용
  * 세부정보가 아닌 행 전체의 정보를 보여주고 싶다면  
    disclosure accessory type (> 모양) 사용을 권장
* Info Button
  * 앱의 상세 설정창을 표시할 때 사용
  * 현재 뷰의 뒷면을 나타낼 때 사용하기도 함
* Add Contact Button
  * 메세지 작성시 / 연락처 리스트 탐색 시  
    텍스트 필드나 다른 뷰 삽입시 사용하는 버튼
  * 이 버튼이 정보 입력을 위한 유일한 수단이 되어선 안 됨  
    -> Add Contact 버튼 이외에도 키보드 입력을 허용해야 함

**Text Field**

* 사용자로부터 적은 양의 정보를 받을 수 있는 요소
* 사용자가 해당 textField를 클릭했을 때, 자동으로 키보드가 올라옴
* placeholder 사용 권장
* clear 버튼 사용 권장

## ViewController의 생명주기

<img src="https://user-images.githubusercontent.com/28949235/120156210-ba9af880-c22c-11eb-9f2b-d767966a017d.png" alt="image" width=400px /><img src="https://user-images.githubusercontent.com/28949235/120156384-e61de300-c22c-11eb-80d6-7c3e6cfcb7f5.png" alt="image" width=300px />

* **viewDidLoad**
  * 뷰 컨트롤러가 메모리에 로드된 후 호출
  * 시스템에 의해 자동으로 호출됨
  * 리소스 추가 / 초기화면 구성
  * 화면이 처음 만들어질 때 한 번만 실행
* **viewWillAppear**
  * 뷰가 계층에 추가되고 화면이 표시되기 직전에 호출
  * 화면이 나타날 때 마다 수행해야 하는 작업 수행
  * 다른 뷰로 갔다가 다시 돌아오는 상황에 해주고 싶은 작업 수행
* **viewDidAppear**
  * 뷰가 계층에 추가되어 화면이 표시된 직후에 호출
  * 뷰를 나타내는 것과 관련된 추가적인 작업 수행
  * 화면에 적용될 애니메이션을 그려줌
* **viewWillDisappear**
  * 뷰가 계층에서 사라지기 직전에 호출
  * 뷰가 생성된 뒤 발생한 변화를 이전 상태로 되돌리기 좋은 시점
* **viewDidDisappear**
  * 뷰가 계층에서 사라진 후 호출
  * 시간이 오래 걸리는 작업은 권장되지 않음

> 다른 뷰로 push했을 때, 다른 뷰의 viewDidLoad 전 원래 뷰의 viewWillDisappear가 호출되고,  
> 다른 뷰의 viewWillDisappear가 호출되고 나서야 원래 뷰의 viewDidDisappear가 호출 됨  
> 그 다음에서야 다른 뷰의 viewDidAppear가 호출 됨

## @IBOutlet과 @IBAction

> Interface Builder Annotation 이라고 부르기도 함

Outlet은 콘센트 개념, Action은 동작 개념

* @IBOutlet
  * 처리 결과를 View에 알리고 원하는 동작을 이끔
  * View에 존재하는 요소와 Controller를 연결하기 위한 변수 개념
* @IBAction
  * 유저의 특정 이벤트 (터치, 드래그, 편집 등)을 감지해서 Controller에게 알림
  * 특정 이벤트 발생 시 실행될 동작들을 정의

## 화면 전환

**모달 Modal**

* 특정 위치를 누르면 새로운 창이 기존 창 위에 뜨는 것
* 사용자의 이목을 끌기 위해 사용
* 화면을 전환한다는 느낌보다는,  
  사용자들을 집중시켜야 하는 화면을 다른 화면 위로 띄워 표현하는 방식
* Alert, Action Sheet, Activity Views(Share Sheets), Modal View

**네비게이션 Navigation**

* 특정 버튼을 누르면 화면이 오른쪽으로 넘어가는 것

### Segue를 통한 화면 전환

> 스토리보드를 통해 출발지와 목적지를 직접 이어주는 방식

* Show
  * Navigation Controller가 연결되어 있다면 Push 처리  
    아닌 경우 Present Modally 처리
* Show Detail
  * 아이패드에서 사용하는 방식
  * Push가 아닌 Replace 방식을 사용
* Present Modally
  * Present 방식 전환
  * Modal Style, Transition Style을 변경해서 다양한 방식 사용 가능
* Popover Presentation
  * 아이패드에서 사용되는 전환 방식
  * 작은 Popup 형태의 뷰를 띄움

### 코드를 통한 화면 전환 - Modality

```swift
guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else { return }

self.present(nextVC, animated: true, completion: nil)
```

**style 변경하기**

```swift
(뷰컨인스턴스).modalPresentationStyle
```

* `.automatic` : 시스템에서 정한 기본 옵션
* `.fullScreen` : 위를 남기지 않고 새로운 모달로 창을 덮음
* `.overCurrentContext` : 새로운 모달창이 투명한 경우, 아래에 깔려있는 이전 뷰도 함께 보임

```swift
(뷰컨인스턴스).modalTransitionStyle
```

* `.coverVertical` : 아래에서 나와 뷰를 올리는 형식
* `.crossDissolve` : 뷰가 교차되며 스르륵 전환됨



```swift
self.dismiss(animated: true, completion: nil)
```



### 코드를 통한 화면 전환 - Navigation

> drill down interface, 깊이와 흐름을 나타내기 위해 사용하는 구조

**네비게이션의 3가지 주요 스타일**

<img src="https://user-images.githubusercontent.com/28949235/120158981-ac021080-c22f-11eb-8c90-a7d4737d3f36.png" alt="image" style="width:200px" />

* 계층 네비게이션
  * 각 화면마다 다른 화면으로 갈 수 있는 선택지를 1개 골라야 함
  * 선택지별로 계층 구조가 존재
  * ex: 설정, 메일

<img src="https://user-images.githubusercontent.com/28949235/120159088-c9cf7580-c22f-11eb-9da2-3338d93676e1.png" alt="image" style="width:200px" />

* 플랫 네비게이션
  * 큰 카테고리 내에서 화면 전환
  * 주로 탭바를 사용하는 형태
  * ex: 앱스토어, 음악

<img src="https://user-images.githubusercontent.com/28949235/120159187-df449f80-c22f-11eb-8a7d-911551f8cd8b.png" alt="image" style="width:300px" />

* 경험적 중심 또는 경험 중심 네비게이션
  * 몰입감을 중요시하는 서비스나 게임에서 많이 사용



계층 / 플랫을 섞어서 혼합 네비게이션 사용도 가능

**Navigation Controller**

> 뷰 컨트롤러 사이 계층 구조를 탐색할 수 있게 해주는 객체  
> 자식 뷰를 Navigation Stack에 쌓고 관리하는 방식

네비게이션 자체가 화면에 대한 관리를 담당하기 때문에,  
네비게이션 컨트롤러는 화면을 나타내주는 뷰 컨트롤러를 관리하는 역할을 하게 됨

가장 먼저 스택에 추가된 뷰컨이 Root View Controller가 됨  
이후에 쌓인 뷰컨들은 아래에서부터 차곡차곡 쌓임

pop : 가장 위에 있던 뷰 컨트롤러가 빠짐  
push : 가장 최근 뷰컨이 최상단에 쌓이게 됨

```swift
self.navigationController?.pushViewController(nextVC, animated: true)
```

```swift
self.navigationController?.popViewController(animated: true)
```

