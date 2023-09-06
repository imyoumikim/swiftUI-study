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

### Section 5.

- 나머지 연산자는 정수만 지원함
- Double끼리 나머지 연산을 수행하고 싶다면? truncationRemainder(dividingBy: ) 메소드 사용

**Overflow 연산자**

- a &+ b (오버플로우 허용)
- a &- b
- a &* b

**비교 연산자**

- ==
- ! =
- <, >
- ≤, ≥

**논리 연산자**

- !
- &&
- ||

**단락 평가**: 논리식에서 결과를 도출하는 데 필요한 최소한의 코드만 실행하는 것

**side effect**: 표현식을 평가했을 때 값이나 상태가 변경되는 것 ← 지양해야 함

**비트 연산자**

- ~
- &
- |
- ^ (XOR)

Signed에서는 산술 시프트 >> 사용

**범위 연산자**

- 오름차순 범위만 작성 가능
- 내림차순은 .reversed() 메소드 사용

**연산자 메소드**

- 기존 연산자가 새로운 형식을 지원하도록 확장하는 방법
- static func *operator* ( *parameters* ) → *ReturnType* {
    *statements*
}
- 주의: 연산자의 우선순위, 결합규칙 바꾸지 않도록. 기존의 기능과 유사하도록 구현. 파라미터와 리턴타입을 기존과 일치하도록.

**Custom Operator**

- 연산자를 가능한 단순한 형태로 선언
- 기존의 연산자와 사용했을때 모호함이 없도록

**adjacent operators are in unordered precedence groups 'DefaultPrecedence' and 'AdditionPrecedence' 에러**

→ 우선순위를 결정해주어야 함

### Section 6.

- if 문
    - 까다로운 조건을 먼저 달기!!
- switch 문
    - fallthrough는 현재 조건을 만족하면 종료되지 않고, 다음 케이스로 이어짐. 그러나 다음 케이스에서는 매치되는 값을 확인하지 않고 실행함.
- guard 문
    - Early Exit: 원하는 조건이 충족되지 않으면 일찍 종료해버림
    - 내부에서 코드 실행 중지해야 함
    - guard 조건이 false여야 else 블록 실행
    - if문에 비해 갖는 장점: 코드 중첩이 없음 → 깔끔
    - 옵셔널 바인딩과 사용 가능
    - 주의: else문은 필수이고, else문은 코드의 실행을 중지해야 함(’guard body must not fall through, consider using a ‘return’ or ‘throw’ to exit the scope)
- expression pattern
    - ~= 연산자: 대상이 어떤 범위에 속하는지 확인
    - switch 구문에서 내부적으로 ~= 연산자가 불려서 사용됨. case의 범위를 확인할 때 사용
    - 두번째 파라미터 right은 value expression과 같은 타입(switch __*value expression*__)

### Section 7.

- repeat - while문(do while과 유사)
    - 일단 실행하고 조건을 확인

### Section 8.

- Control Transfer Statements
    - break
    - continue
    - labeled

### Section 9.

- 옵셔널 바인딩에서는 같은 이름을 사용을 허용. ex) if let num = num { … }
- Implicitly Unwrapped Optionals
    - 옵셔널이지만 특정 조건에서 자동으로 추출됨
    - 직접 강제 추출도 가능
- Nil-Coalescing Operator
    - a ?? b
    - 왼쪽 피연산자 a 에 값이 저장되어있다면 그 값을 그대로 쓰고, 없다면 오른쪽 피연산자 b를 사용
    - 값이 저장되어있는지 확인하는 코드와 값을 추출하는 코드를 작성할 필요 X
- Optional Chaining
    - ( ) = void
    - 옵셔널 딕셔너리에서 key를 통해 값을 얻을 때는 [] 앞에 ?를 붙임
    - subscript가 리턴하는 값을 통해서 속성에 접근하거나 메소드를 호출할 때
    - 옵셔널 체이닝의 속성 중 nil이 있다면 뒤의 속성에도 접근하지 못하고 nil을 리턴
    - 옵셔널 체이닝의 결과는 항상 옵셔널
- Optional Pattern
    - Enumeration case Pattern의 옵셔널 버전
    - 별도의 guard문 작성이 필요X → 코드 간결
