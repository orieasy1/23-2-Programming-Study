<h1>Ch5. 참조타입</h1>

자바의 데이터 타입은 크게 기본 타입과 참조 타입으로 분류한다.
기본 타입에는 정수타입(byte, char, short, int long), 실수 타입(float, double), 논리타입(boolean)이 있다.
참조 타입에는 배열 열거, 클래스, 인터페이스 타입이 있다.
<br><br>
기본타입으로 선언된 변수와 참조타입으로 선언딘 변수의 차이점은 저장되는 값이다.
기본 타입으로 선언된 참조타입으로 선언된 변수는 값 자체를 저장하고 있지만 참조 타입으로 선언된 변수는 객체가 생성된 메모리 번지를 저장한다.

**객체(object)는 데이터와 메소드로 구성된 덩어리이다.**
<br><br>
변수들은 모두 스택(stack)이라는 메모리 영역에 생성된다.
앞서 말한 것처럼 기본타입 변수는 스택 영역에 직접 값을 저장하고 있지만 참조타입 변수는 힙(heap) 메모리 영역의 객체 번지를 저장하고 이 번지를 통해 객체를 참조한다.
<br>

* 메소드 영역: 바이트코드 파일을 읽은 내용이 저장되는 영역
    <br>클래스 별로 상수, 정적 필드, 메소드 코드, 생성자 코드 등이 저장됨
* 힙 영역: 객체가 생성되는 영역
    <br>객체의 번지는 메소드 영역과 스택 영역의 상수와 변수에서 참조할 수 있음
* 스택 영역: 메소드를 호출할 때마다 생성되는 프레임이 저장되는 영역
    <br>메소드 호출이 끝나면 프레임은 자동 제거됨, 프레임 내부에는 로컬 변수 스택이 있는데 여기에서 기본 타입 변수와 참조타입 변수가 생성되고 제거됨

<br>

<h3>5.5 문자열 타입</h3>

자바에서 문자열 리터럴은 " "(큰따옴표)이고 문자열 리터럴을 저장하는 타입은 String 타입이다.
보통 문자열을 String 변수에 저장한다고 표현하지만, 문자열은 스트링 객체로 생성되고 변수는 String 객체를 참조한다(객체의 번지가 대입된다).

```java
String name;
name = "홍길동";
String hobby = "여행";
```

**문자열 비교**

```java
String str1 = "자바문자열";
String str2 = "자바문자열";
String str3 = new String("자바문자열");
String str4 = new String("자바문자열");
```

1. 문자열 리터럴이 동일하다면 같은 String 객체를 공유한다.

str1과 str2 변수에는 동일한 객체의 번지가 저장된다.
str1 == str2는 참이다.

2. new 연산자로 String 객체를 생성했을 경우 서로 다른 객체를 가지게 된다.

new 연산자는 새로운 객체를 만드는 연산자로 객체 생성 연산자라고 한다.
str3과 str4 변수에는 서로 다른 String 객체의 번지를 가지게 된다.
또한 str1 == str3도 거짓이다.

3. 동일한 String 객체든 다른 String 객체든 상관없이 내부 문자열만을 비교할 경우에는 String 객체의 equals() 메소드를 사용한다.
<br>

EqualsExample.java

```java
public class EqualsExample {
    public static void main(String[]args) {
        String str1 = "홍길동";
        String str2 = "홍길동";

        if(str1 == str2) {
            System.out.println("str1과 str2는 참조가 같음");
        } else {
          Syste.out.println("str1과 str2는 참조가 다름");
        }

        if str1.equals(str2){
            System.out.println("str1과 str2는 문자열이 같음");
        }


        String str3 = new String("홍길동");
        String str4 = new String("홍길동");

        if(str3 == str4) {
            System.out.println("str3과 str4는 참조가 같음")
        } else {
            System.out.println("str3과 str4는 참조가 다름름")
        }

        if str3.equals(str4){
            System.out.println("str3과 str4는 문자열이 같음");
        }
    }
}
```

4. 빈 문자열도 String 객체로 생성되기 때문에 변수가 빈 문자열을 참조하는지 조사하려면 equals 메소드를 사용해야한다.

```java
public class EmptyString Example {
    public static void main(String[] args) {
        String hobby = "";
        if(hobby.equals("")) {
            System.out.println("hobby 변수가 참조하는 String 객체는 빈 문자열");
        }
    }
}
```

**문자 추출**

charAt() 메소드: 문자열에서 특정 위치의 문자를 얻고 싶을 때 사용, 매개값으로 주어진 인덱스의 문자를 리턴

```java
String subject = "자바 프로그래밍";
char charValue = subject.charAt(3)
```

주민등록번호에서 성별에 해당하는 7번째 문자를 읽고 남자인지 여자인지를 출력하는 코드

```java
public class CharAtExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("주민등록번호를 입력하세요: ");
        String idn = scanner.nextLine();

        char sex = idn.charAt(6);
        switch (sex) {
            case '1':
            case '3':
                System.out.println("남자입니다");
                break;
            case '2':
            case '4':
                System.out.println("여자입니다");
                break;
        }
    }
}
```
<br>

**문자열 길이**

length(): 문자열에서 문자 개수를 얻고 싶을 때 사용

```java
String subject = "자바 프로그래밍";
int length = subject.length();
```
<br>

**문자열 대체**

replace(): 특정 문자열을 다른 문자열로 대체하고 싶을 때 사용

기존 문자열은 그대로 두고, 대체한 새로운 문자열을 리턴함

```java
String oldStr = "자바 프로그래밍";
Stirng newStr = oldStr.replace("자바", "JAVA");
```

String 객체의 문자열은 변경이 불가한 특성을 갖고 있다.
replace() 메소드는 원래 문자열의 수정본이 아니라 완전히 새로운 문자열을 반환한다.
newStr 변수는 새로 생성된 "JAVA 프로그래밍" 문자열을 참조한다.
즉, stack영역의 oldStr은 힙 영역의 "자바 프로그래밍"이라는 객체를 참조하고 newStr은 힙 영역의 "JAVA 프로그래밍"이라는 객체를 참조하는 것이다.
<br>

**문자열 잘라내기**

substring() 메소드: 특정 위치의 문자열을 잘라내어 가져오고 싶을 때 사용

* substring(시작인덱스): 입력한 인덱스에서 끝까지 잘라내기
* substring(시작, 끝): 입력한 시작 인덱스에서 끝 인덱스까지 잘라내기

```java
public class SubStringExample {
    public static void main(String[] args) {
        String idn = "031025-41234567";
        
        String firstNum = idn.substring(0, 6);
        System.out.println(firstNum);
        
        String secondNum = idn.substring(7);
        System.out.println(secondNum);
    }
}
```
<br>

**문자열 찾기**

indexOf() 메소드: 문자열에서 특정 문자열의 위치를 찾고자 할 때 사용

* 주어진 문자열이 시작되는 인덱스를 반환
* 주어진 문자열이 포함되어 있지 않으면 -1을 반환

```java
public class indexOfContainsExample {
    pubic static void main(String[] args) {
        Strng
    }
}
```