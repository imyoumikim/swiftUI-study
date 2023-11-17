### Hashable Protocol

* Custom struct를 생성한 경우에는 같은 인스턴스인지 여부를 판단할 기준을 지정해주어야 함
* ==에서 비교 구현에 사용되는 요소와 hash() 안에 hasher.combine()에 지정하는 요소는 일치해야 함

(hash() 메소드는 주어진 요소를 Hasher에 제공하여 해시하도록 함)