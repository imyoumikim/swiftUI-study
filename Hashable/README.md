### Hashable Protocol

* Custom struct로 인스턴스 리스트를 만들어서 Set으로 중복 제거를 하려던 과정에서 내가 의도한 바와 다른 기준으로 같은 객체 여부를 판단하는 것을 발견
* 즉, Custom struct를 생성한 경우에는 같은 인스턴스인지 여부를 판단할 기준을 지정해주어야 함
* 추가로, func ==에서 비교 구현에 사용되는 요소와 hash() 안에 hasher.combine()에 지정하는 요소는 일치해야 함
* hash()의 역할: 주어진 요소를 Hasher에 제공하여 해시하도록 함

* 중복 제거를 위하여 Array -> Set -> Array로 변환한 결과 출력
* 조건: x, y가 같은 경우, 같은 인스턴스로 판단
<img width="626" alt="스크린샷 2023-11-17 오후 5 10 03" src="https://github.com/youmikimm/swiftUI-study/assets/99166914/6b507f27-13c2-4e16-be81-959877126a8a">

* 조건: x가 같은 경우, 같은 인스턴스로 판단
<img width="626" alt="스크린샷 2023-11-17 오후 5 10 16" src="https://github.com/youmikimm/swiftUI-study/assets/99166914/119a4c86-db9b-4693-a3d0-e3490931f4d8">

* 방법: hash() 안에 hash.combine()을 조작
