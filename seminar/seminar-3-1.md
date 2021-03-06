# SOPT 28기 iOS 3차 세미나

## 시작하는 스토리보드 바꾸기

### 방법 1: SceneDelegate

SceneDelegate.swift 파일에서 `willConnectTo` 함수에  

```swift
window!.rootViewController = UIStoryboard(name: "Test", bundle: nil).instantiateInitialViewController()!
```

### 방법 2: info.plist

info.plist - Aplication Scene Manifest - Storyboard Name 변경  

### 방법 1 vs 방법 2

두가지 파일에서 동시에 다른 스토리보드 시작점을 정의한다면  
SceneDelegate가 우선적으로 적용 됨.

# 데이터 전달

## 1. 직접 전달 방식 (동기 방식)

> A에서 B로 데이터를 "직접" 넘겨줌

* present / push 시에 프로퍼티에 접근해 넘겨주는 방식
  * 이 때, 정확한 데이터의 전달은 present / push 하면서 일어남.
* segue prepare 메소드를 활용해서 데이터를 넘겨주는 방식
  * segue를 통한 화면 전환이 일어나기 전, prepare(for: sender) 메소드가 호출됨.  
    이 함수를 오버라이드 해서 필요한 데이터를 전달
* Protocol / Delegation 을 활용해서 데이터를 넘겨받는 방식
* Closure를 활용해서 데이터를 넘겨받는 방식
* NotificationCenter를 활용해 데이터를 넘기는 방식

### 2. 간접 전달 방식 (비동기 방식)

> A는 데이터를 다른 곳에 던져두고 B는 나중에 필요할 때 꺼내감

* AppDelegate.swift 활용
* UserDefaults 사용하기
* CoreData or Realm 활용하기



---

> 자세히 알아보기 - 직접 전달 방식

## ☝️ Protocol / Delegation 을 활용해서 데이터를 넘겨받는 방식

### Protocol? Delegate?  

> delegate들은 protocol 형태로 구현됨

**프로토콜** : 특정 작업이나 역할을 수행하기 위한 청사진  
	반드시 구현해야 하는 기능들만 나열하고, 실제 구현은 프로토콜에서 이뤄지지 않음

```swift
protocol 치킨매뉴얼 {
  func 반죽하기()
  func 재료섞기()
  func 튀기기()
  func 장식하기()
}
```

**프로토콜 채택**: 다른 타입 (구조체, 클래스, 열거형)에게 "이 프로토콜대로 구현해줘!" 라고 전달하는 개념.  
	프로토콜을 채택하게 되면 해당 프로토콜의 요구사항을 실제로 구현할 수 있음

```swift
class 사장님A : 치킨매뉴얼 {
  // 사장님 A가 치킨매뉴얼이라는 프로토콜을 채택함
  func 반죽하기() { 반죽을 찰지게 하고... }
  func 재료섞기() { 민트초코를 한스푼 넣고... }
  func 튀기기() { 200도에서 5분간 튀기고... }
  func 장식하기() { 위에 초코칩을 올리고... }
}
```

```swift
class 사장님B : 치킨매뉴얼 {
  func 반죽하기() { 반죽을 대충 하고... }
  func 재료섞기() { 치즈를 두 스푼 넣고... }
  func 튀기기() { 300도에서 15분간 튀기고... }
  func 장식하기() { 위에 치즈를 올리고... }
}
```



**delegate** : 위임하다 / 대표하다  
객체지향 프로그래밍에서 "하나의 객체가 모든 일을 하는 것" 이 아닌,  
처리해야 하는 일 중 일부를 다른 객체에게 "위임"하는 것

```swift
protocol 박스기능들 {
  기능1
  기능2
  기능3
  기능4
}
```

```swift
class box {
  var delegate: 박스기능들
  func 특정상황1() {
    delegate.기능1
  }
}
```

```swift
class A : 박스기능들 { // "박스기능들" 이라는 프로토콜 채택
  var 박스 : box // box 생성
  
  박스.delegate = self // 위에 선언한 box의 delegate(대리자)는 A(self)가 할게!
  
  func 기능1 {
    print("안녕하세요") 
    // box의 delegate가 A가 되었으니
    // box에서 특정상황1이 발생했을 때
    // delegate.기능1에서 이 함수가 호출됨
  }
  
  // ... 기능2, 3, 4 구현
}
```

`class box` : "야, 나 일일이 다 구현하기 힘드니까 특정 상황 발생하면 신호만 전달해줄게 구현은 니가 알아서 해라!"    
처럼 A에게 일을 대신(delegate) 하라고 시키는 것.

이렇게 delegate의 채택을 통해 필요한 부분에 있어서만 기능을 구현하는 모습을  delegate pattern이라고 부름  
delegate pattern을 활용해서 동시에 여러 클래스에서 각자 자기 클래스에 맞게 구현이 가능함

## pop 할 때 데이터 전달하기

>  A -> B로 push 했다가 B -> A로 pop할 때 데이터 전달하기

**B에 protocol 생성하기**

```swift
protocol SampleProtocol {
  func dataSend(data: String)
}
```

**B에 delegate 프로퍼티 생성하기**

```swift
var delegate: SampleProtocol?
```

**B의 pop 트리거 핸들러에서 데이터 전달하기**

```swift
if let text = myTextField.text {
  delegate?.dataSend(data: text)
}
// delegate 처리가 끝난 후에 pop 처리
self.navigationController?.popViewController(animated: true)
```

**A에서 프로토콜 채택하기**

```swift
class FirstViewController: UIViewController, SampleProtocol {}
```

**A에서 프로토콜 stubs 추가하기**

```swift
func dataSend(data: String){
  // 구현부 작성하기
  myLabel.text = data
}
```

**A에서 push할 때 대리자 self 지정하기**

```swift
guard let nextVC = self.storyboard?.instantiateViewController(identifier: "어쩌구") as? SecondViewController else { return }

nextVC.delegate = self

self.navigationController?.pushViewController(nextVC, animated: true)
```

대신해서 처리할 부분이 FirstViewController 라는 것을 `nextVC.delegate = self` 구문을 통해 선언

## ☝️ Closure를 활용해서 데이터를 넘겨받는 방식

> 클로저 사용의 장점  
>
> * delegate보다 간결하게 코드 작성 가능
> * 함수 / 프로토콜 없이 지역 변수 범위 안에서 다룰 수 있음

**B에 클로저 타입의 프로퍼티 선언하기**

```swift
var completionHandler: ((String) -> (String))?
```

**(B) 위에서 선언해둔 클로저에 원하는 데이터를 넣어두기**  
(그러면 completion 클로저가 호출됨)

```swift
@IBAction func touchButton(_ sender: Any) {
  _ = completionHandler?(self.textField.text ?? "")
  
  self.navigationControlelr?.popViewController(animated: true)
}
```

**(A) completionHandler를 정의하기**

```swift
guard let vc = storyboard?.instantiateViewController(...)

vc.completionHandler = {
  text in
  self.myLabel.text = text
  return text
}

self.naviagtionController!.pushViewController(vc, animated: true)
```

"text가 들어오면, 해당 text를 label에다 표시해줘!" 라는 뜻  
(클로저를 위와 같이 정의하게 되면, 클로저에서 텍스트를 넘겨주게 되면 A의 라벨의 텍스트가 변경됨)

## ☝️ NotificationCenter를 활용해 데이터를 넘기는 방식

> NotificationCenter: 정볼르 전달하기 위한 구조체. 방송국 개념

![image](https://user-images.githubusercontent.com/28949235/122212856-45454e00-cee3-11eb-9eb1-5d39fa7412de.png)

요런 느낌... 알아야 하는 두 가지!

1. **VC1 --> NotificationCenter로 post 하는 방법**

   ```swift
   NotificationCenter.default.post(name: NSNotification.Name("신호 이름"),
                                  object: "전달하고 싶은 데이터",
                                  userInfo: [KEY:VALUE])
   ```

   * name: 전달하고자 하는 신호 이름
   * object: 전달하려고 하는 데이터  
     (데이터 형 상관X, 구조체 같은 것들도 가능, 없으면 nil)  
   * userInfo: Notification과 관련된 값 또는 객체의 저장소, 없으면 nil

2. **NotificationCenter에 Observer를 등록하는 방법**

   ```swift
   NotificationCenter.default.addObserver(self, 
                                         selector: #selector(실행할 함수),
                                         name: Notification.Name("신호 이름"),
                                         object: nil)
   ```

   ```swift
   @objc func 실행할 함수 (notification: NSNotification) {
     // 구현부
   }
   ```

   * self: 현재 자기자신 뷰컨에 옵저버를 달겠다!
   * selector: 해당 신호를 받으면 실행하는 함수 부분
   * name: 신호를 구분하기 위한 이름
   * object: 해당 신호를 걸러주는 필터같은 역할  
     nil 사용시 해당 신호를 모두 받겠다는 의미

   

즉, VC1에서 특정 신호를 NotificationCenter를 통해 post 하게 된다면,  
해당 신호를 Observer로 등록해놓고 있다면  
해당 Observer에 걸린 함수가 실행되는 형태

* A에서 push할 때 observer를 달고

* B의 @IBAction 등 트리거 함수 내에서 post

### 유의사항

NotificationCenter를 활용할 때 유의할 점 : **Observer가 메모리 상에 올라와 있어야만 수신이 됨**  
ex) B에 Observer를 달고 A->B로 push 할 때 post를 하면 데이터 전달이 안 됨.  
( 아직 Observer가 메모리 상에 없기 때문에 )



---

> 자세히 알아보기 - 간접 전달 방식

## ✌️ UserDefaults 활용

**UserDefaults** : Key-value 형태로 값을 저장/쓰기가 가능한 클래스 
기기에 .plist 형태로 저장됨 -> **앱을 종료하더라도 데이터가 보존**되어 있음

간단한 사용자정보 (자동로그인 여부, 환경 설정 체크 여부 등)을 저장하는데 적합  
(But 내부에 데이터가 파일 형태로 저장되기 때문에 보안상 취약함)

간단한 값을 저장하는 데 좋음!

```swift
// 데이터 저장
UserDefaults.standard.set("choyi", forKey: "username")
```

```swift
// 데이터 불러오기
// "username" Key를 가진 object를 string형으로 가져오기
let aUSer: String = UserDefaults.standard.object(forKey: "username") as! String
// "username" Key를 string!형으로 바로 가져오기
let bUSer: String = UserDefaults.standard.object(forKey: "username")!
```



## ✌️ AppDelegate.swift 활용

**AppDelegate**

* 앱의 scene을 환경설정하고
* 앱의 가장 중요한 데이터 구조를 초기화 하는 역할
* iOS 시스템에 의해서 "하나의 인스턴스"만 존재하도록 보장됨

* AppDelegate에 데이터를 저장해놓고, 앱을 종료하면 데이터가 전부 **초기화 됨!**

```swift
// 변수 선언
var mode: Int?
```

```swift
// 아무 클래스 내에서
let ad = UIApplication.shared.delegate as? AppDelegate
```

선언해주면 모든 클래스에서 이 변수에 대해 접근이 가능함 (프로젝트 전역 변수 개념)

```swift
// 사용예
ad?.mode = 1 // 쓰기
let appMode = ad?.mode // 값 불러오기
```



## ✌️ Coredata / Realm 활용

복잡한 데이터를 저장할 때 적합한 방법

