## 인프런 - iOS 개발을 위한 swift5 완벽 가이드

### Section 1.

dump()는 print()보다 더욱 상세한 결과를 출력
→ 문자열과 문자열이 아닌 것을 구분 가능하도록

### Section 2.

Token: 문법적으로 더 이상 쪼갤 수 없는 단위(식별자, 구두점, 연산자 등)

Expression = 표현식: 하나의 결과값이 나오는 코드

컴파일, 링크가 이뤄지면 실행파일이 생성됨 ← 이 과정을 Build라고 부르기도 함(더 넓은 범위를 포함하는 용어)

실행파일에는 Debug mode(앱 만들 때), Release mode(앱스토어에 올릴 때)가 있음

Compile Time = 코드 ~ 실행파일 생성까지

Run Time = 실행 시

First Class Citizen: 상수, 변수에 저장할 수 있음. 파라미터로 전달 가능. 함수에서 리턴 가능

### Section 3.

변수 타입은 한번 결정되면 바꿀 수 없음

ex) var name = “Tim”

name = 3.3 (X)

**상수를 선언하는 이유**

1. 실수로 값을 변경할 염려가 없음
2. 컴파일러가 별도로 최적화하여 코드 실행이 빨라짐

→ 되도록 let으로 선언하고, 변경할 필요가 생기면 그 때 var 선언하기

**Scope**

같은 이름의 변수가 서로 다른 범위에 존재한다면, 더 인접한 범위의 변수를 사용

### Section 4.

**Built-in Data type**

- 정수
    - 1,000,000 대신 1_000_000로 표기
- 실수
    - Float은 최대 6자리의 정확성을 가지고 있음
    - Double은 최대 15자리의 정확성을 가지고 있음
- Boolean
    - Bool 대신 0, 1로 표기 불가하고, 오로지 true, false만 사용 가능
- Character
- String
    - “a”와 같은 한 글자는 String이 될 수도 있고, Character가 될 수도 있음

**Type Inference**

- 초기값이 있어야 자료형을 추론할 수 있음
- 정수는 Int, 실수는 Double로 자동 추론

**Type Safety(형식 안정성)**

- 자료형의 이름이 다르다면 무조건 호환 X
    - Int에 Int64를 넣어도 안됨
- 연산하려면 서로 같은 자료형이어야 함 ex) 10 + 3.14(X)

**Type Conversion**

- *Type*(*value*)와 같은 방법
- ex) Int(3.14)

typealias 키워드로 타입에 대한 별칭 지정 가능
