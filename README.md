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

First Class Citizen: 상수, 변수에 저장할 수 있음 / 파라미터로 전달 가능 / 함수에서 리턴 가능

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

- 옵셔널 바인딩에서는 같은 이름 사용을 허용. ex) if let num = num { … }
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

### Section 10.

- 함수의 핵심은 Reusability → 중복을 줄임
- return의 역할 2가지: 함수 실행 중지 / 함수의 실행 결과를 리턴
- 함수의 매개변수(formal parameter) = 함수 body에서 사용할 수 있는 임시 상수(즉, body에서 수정 안 됨)
- 인자(argument) = actual parameter
- 기본값을 설정해두면 함수를 호출할 때 그 값을 굳이 적을 필요 X
- 인자 레이블(Argument Label)
    - (name: Type) = name은 Parameter Name이자 Argument Label
    - (label name: Type) = label은 Argument Label, name은 Parameter Name
    - 인자 레이블은 함수를 호출할 때 사용하는 이름, 함수 body 내에서 사용하는 이름 X
    - 같은 이유로 함수를 호출할 때 매개변수명을 사용하면 에러
- 가변 매개변수
    - 가변 매개변수는 함수당 하나씩만 선언 가능. 즉, (a: Int…, b: Double…) 불가. 위치나 순서는 상관 없음.
    - 기본값을 가질 수 없음
- In-Out 매개변수
    - copy in - 보통의 매개변수와 동일함. 변수에 저장된 값을 함수 body 내부로 복사
    - copy out - 실행이 종료되면 함수에서 변경된 값이 인자로 복사됨
    - 상수와 리터럴은 inout 매개변수로 전달 불가 ← 바꿀 수 없으므로
    - 기본값 선언 불가
- Nested 함수
    - 함수에서 nested 함수를 리턴하면 nested 함수의 범위가 함수를 호출한 곳으로 확장됨
    - 그러나 범위가 확장됐다고 해서 직접 호출 가능한 것은 아님. 리턴된 함수를 통해서 간접적으로 호출

### Section 11.

- 클로저 = 비교적 짧고, 독립적인 코드 조각
    - Named Closure = Function, Nested Function
    - Unnamed Closure = Anonymous Function
- 함수와 클로저는 서로 호환됨
- 클로저를 호출할 때는 인자 레이블 사용 X
- 매개변수명을 생략
- 코드를 단축시키는 규칙
    1. 파라미터 타입과 리턴형을 생략
    2. 파라미터명을 생략하고 shorthand argument name으로 대체. ex) $0, $1
    3. 클로저에 포함된 코드가 단일 리턴문이라면 return 키워드 생략
    4. 클로저가 마지막 파라미터라면 trailing 클로저로 작성
    5. 괄호 사이에 파라미터가 없다면 괄호를 생략
- 클로저 내부에서 외부에 있는 값에 접근하면 값에 대한 참조를 획득하게 되고, 클로저 내부에서 값을 바꾼다면 외부의 원래 값도 바뀜
- 클로저에서 메모리 관리를 하지 않는다면 참조 사이클 문제가 발생할 수 있음
- Escaping Closure
    - 함수의 실행이 종료된 후에도 실행될 수 있음. 즉, 함수 실행이 종료된 이후에 끝날 수도 있는 것.
    - 파라미터 생명주기?
        - 파라미터는 함수가 실행되면 생성되었다가 함수의 실행이 끝나면 자동으로 제거됨

### Section 12. Tuples

- 튜플은 Compound 타입
- 각 요소에 인덱스 또는 멤버 이름으로 접근 가능
- 튜플을 분해할 때는 저장할 변수(상수)의 개수와 튜플의 멤버 개수가 일치해야 함

### Section 13. String and Character

- “c”와 같이 한 글자를 Character 타입으로 지정하려면 타입을 지정해주어야 함. 아니면 String으로 자동 타입 추론
- NSString과 String(Foundation)은 Toll-Free Bridge
    - 서로 호환이 가능한 타입이라는 뜻! 그러나 타입캐스팅은 필요함
    - 유니코드를 처리하는 방식이 서로 다르니까 사용에 주의할 것
- Mutability
    - let로 선언 시 불변, var로 선언 시 가변
- Multiline
    - 큰 따옴표 세 개 (”””)로 구분
    - 뒤의 큰 따옴표 세 개의 시작 위치가 String의 들여쓰기 시작 위치를 가리킴
- String interpolation
    - 문자열을 동적으로 생성
    - 포맷 지정자
        - %10d: 10칸짜리 정수(오른쪽 정렬)
        - %-10d: 10칸짜리 정수(왼쪽 정렬)
        - %8.3f: 8칸짜리 실수, 소수점 아래 3자리
        - %010.3f: 10칸짜리 실수, 소수점 아래 3자리
- String 생성자를 사용하여 문자열 생성 가능(어떤 타입이든)
- N진수로 바꾸어 문자열 생성 - String(123, radix: 16)
- 문자열은 문자들의 집합 = Character Sequence
    - 따라서 for … in 반복문에서 사용 가능
    - 문자열에 숫자를 저장하고 이 중 하나를 랜덤으로 뽑기도 가능 ← randomElement()
    - “12345”와 같은 문자열을 쪼개서 랜덤으로 배치하여 [”3”, “4”, “5”, “2”, “1”] ← shuffled()
- Substring
    - .prefix() → 값을 읽어오기만 할 때는 원래 메모리를 공유하고, 값을 변경하게 되면 새로운 메모리가 생성됨
    - 범위 연산자와 .startIndex, .endIndex를 활용
- 문자열 편집
    - 이름 뒤에 ing 또는 ed가 붙어있는 메소드는 원본을 변경하지 X
    - insert()로 추가
    - remove, removeFirst, removeLast로 삭제
    - removeAll는 메모리 공간까지 삭제 / removeAll의 keepingCapacity를 true로 주면 메모리 공간 유지 가능. 만약 문자열을 초기화하고 비슷한 길이의 문자열을 다시 저장하고자 한다면 메모리 공간을 유지하는 것이 좋음.
    - replaceSubrange()로 일정 범위를 내가 원하는 문자열로 대체
    - drop, dropFirst, dropLast 메소드들은 Substring을 리턴
- 문자열 비교
    - <, >, == 비교연산자로 문자열 순서 가능
    - 아스키 코드 상 소문자가 대문자보다 더 큰 값을 가짐
- 문자열 찾기
    - commonPrefix()는 공통된 접두어를 리턴
- 문자열 옵션
    - Swift는 여러개의 코드 유닛을 주면 조합해보고 같은지 다른지 여부를 판단함. 따라서 ‘한’의 유니코드와 ‘ㅎㅏㄴ’의 유니코드를 같다고 봄. compare 메소드를 사용할 때, .literal 옵션을 주면 유니코드를 처음부터 비교해서 하나라도 다르다면 바로 false하기 때문에 옵션을 주지 않았을 때보다 속도가 더 빠름. .literal 옵션이 없다면 합쳐보는 과정이 필요하기 때문. 그러나 실제로 체감하기는 어려운 차이.
    - .anchored 옵션은 검색 부분을 처음이나 끝으로 제한
        - .anchored 옵션을 .backwards와 함께 사용하면 접미어 비교와 같음
        - .anchored 옵션 단독으로 사용하면 접두어 비교와 같음
