# SOPT 28기 iOS 1차 세미나 - Review

## iOS 계층 구조

> iOS : 유닉스 기반의 맥 OS X를 기반으로 해서 다윈 커널을 가지고 있는 모바일 OS

<img src="https://user-images.githubusercontent.com/28949235/121845611-ae309880-cd20-11eb-9d09-d226169018cf.png" alt="image" width=200px /> 아래로 갈수록 기본(iOS의 핵심 / 하드웨어 관련), 위로 갈수록 사용자와 관련이 있음.

### Application

> Apple App, Third-Party App

* iOS의 가장 바깥 계층
* Apple App, Third - Party App이 여기에 속함
* 사용자와 가장 맞닿아 있는 계층

### Cocoa Touch

> UIKit, Foundation

* 화면의 그래픽 UI 및 터치의 기능 제공
* UIKit, MapKit, MessageUI 등이 여기에 속함
* 실제로 개발할 때 가장 많이 접하게 되는 계층

### Media

> Open GLES, Quarts, Core Graphics, Core Audio, OpenAL, MediaPlayer

* 그래픽이나 오디오, 비디오 등 멀티미디어 기능을 제공하는 계층
* C와 Objective-C가 혼합되어 있는 형태
* AvFoundation(미디어 재생 관련), MediaPlayer(플레이어), Core Image(이미지 가공) 등의 기능이 있음

### Core Service

> Address Book, Core Foundation, Core Location, CFNetwork, SQLite, XML Support

* GPS 나침반, 가속도 센서, 자이로스코프 디바이스 등 하드웨어적 기능들
* Core OS에서 제공하지 않는 기능들을 포함
* 내부 데이터/위치/센서 등의 기능을 제공
* CoreMotion(기기 센서), Accounts(계정 관리), Core Foundation(데이터 관리) 등의 기능 제곰

### Core OS

> System Utilities, Mach Kernel

* 하드웨어와 가장 가까이 있는 최하위 계층
* 시스템의 핵심 기능을 포함하는 기본적인 부분들을 관리

## iOS App States 앱 상태변화

<img src="https://user-images.githubusercontent.com/28949235/121846204-9dcced80-cd21-11eb-996e-fa01dd78b171.png" alt="image" width=400px />

**foreground & background**

* foreground
  * 사용자가 보고 있는 화면
  * CPU를 비롯한 시스템 자원의 우선순위가 높은 상태
* background
  * 앱이 사용자에게 보이지 않는 상태
  * ex: 앱 인디케이터를 올려 홈 화면으로 이동했을 때 앱의 상태



**애플의 가이드라인**

* 앱의 상태 변화에 따라 적절히 대응할 것
  * 그렇지 않으면 데이터 손실, 사용자에게 좋지 않은 경험 제공 가능성 O
* 앱의 상태가 background로 변할 때, 앱이 이에 대해 적절하게 대응해야 함
* 앱의 시스템 변경 사항을 보고하는 알람을 등록하는 것을 권장
  * 앱이 중지된다면 시스템 큐에 들어갔다가 다시 실행하게 됨



**state 살펴보기**

* Not running
  * 실행되지 않거나 종료된 상태
* Inactive
  * 앱이 전면에서 실행 중이지만, 아무런 이벤트를 받고 있지 않는 상태
* Active
  * 앱이 전면에서 실행 중이며, 이벤트를 받고 있는 상태
* Background
  * 앱이 background에 있지만 여전히 코드가 실행되고 있는 상태
  * ex: 파일 다운로드, 파일 업로드, 연산처리 등
  * 여분의 실행 시간이 필요한 앱일 경우 특정시간 동안 background 상태로 남아있게 됨
* Suspended
  * 앱이 보이지 않고 실행되는 코드도 없는 상태
  * 메모리에 유지는 되고 있음
    * But, iOS 시스템은 메모리가 부족하면 Suspend 상태에 있는 앱들을 정리함
  * ex: 다른 앱을 사용하다가 원래 앱으로 돌아왔을 때, 처음부터 앱이 실행되었다면  
    Suspend 상태에 들어갔다가 메모리 부족으로 앱이 정리된 후 처음부터 실행된 것

## App Launch Cycle

> App이 실행되면 시스템은 앱의 메인 함수를 메인 스레드에서 호출하기 위해  
> 프로세스와 메인 스레드를 생성하게 됨
>
> Xcode 프로젝트의 메인 함수는 UIKit Framework를 제어할 수 있게 해줌

<img src="https://user-images.githubusercontent.com/28949235/121846765-817d8080-cd22-11eb-9bab-bce8384daad2.png" alt="image" width=700px />

## 라이브러리와 프레임워크

### 라이브러리

자주 쓰일 만한 기능들을 모아 놓은 유틸(클래스)들의 모음집

사용자(프로그래머)와 실제 구현하고자 하는 기능 사이에  
프로그래머에게 기능을 쉽게 제공해주는 중간 계층이라는 의미에서  
프레임워크와 맥락은 비슷함

### 프레임워크

프레임워크 = 라이브러리 개념 + 뼈대가 되는 클래스들 + 클래스들의 관계로 만들어진 설계 기본 틀

프레임워크에는 해당 프레임 워크의 제작자가 만들어 놓은 "기반 코드"같은 개념이 존재함  
사용자들은 해당 프레임워크를 사용해 본인이 원하는 기능들을 구현함  

이러한 '기반 코드'에는 설계자가 설계한 구조를 유지하면서 확장할 수 있도록  
"의도된 제약 사항"이 존재함

설계의 기반이 되는 부분을 기술한 확장 가능한 기반 코드와  
사용자가 이 코드를 자신의 입맛대로 확장하는데 필요한 라이브러리가 합쳐진 개념

"기본적 설계 + 라이브러리는 줄테니까 넌 개발에만 집중해!" 하면서 주는 것 = 프레임워크

