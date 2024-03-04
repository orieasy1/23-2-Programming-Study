<h1>김영한 자바 강의: 섹션1. 클래스와 데이터</h1>

자바 세상은 클래스와 객체로 이루어져 있다.
클래스와 객체라는 개념이 왜 필요한지, 클래스가 어떤 방식으로 발전하면서 만들어졌는지에 대해 알아볼 것이다.

<h3>클래스가 필요한 이유</h3>

이름:학생1 나이:15 성적:90
이름:학생2 나이:16 성적:80

위와 같은 출력값을 얻기 위해서 아래와 같이 코드를 작성할 수 있다.

```java
public class ClassStart1 {
    public static void main(String[] args) {
        String student1Name = "학생1";
        int student1Age = 15;
        int student1Grade = 90;

        String student2Name = "학생2";
        int student2Age = 16;
        int student2Grade = 80;

        System.out.println("이름:" + student1Name + " 나이:" + student1Age + " 성적:" + student1Grade);
        System.out.println("이름:" + student2Name + " 나이:" + student2Age + " 성적:" + student2Grade);

    }
}
```

그러나 이렇게 작성할 경우 학생 수가 늘어날 때 마다 추가적으로 변수를 작성하고 출력하는 코드를 추가해야하기 때문에 코드가 길어지고 복잡해진다.

이를 개선하기 위해 출력의 경우 반복문을 사용할 수 있고, 변수 선언에 있어서는 배열을 사용할 수 있을 것이다.

```java
public class ClassStart2 {
    public static void main(String[] args) {
        String[] studentNames = {"학생1", "학생2"};
        int[] studentAges = {15, 16};
        int[] studentGrades = {90, 80};

        for(int i = 0; i < studentNames.length; i++) {
            System.out.println("이름:" + studentNames[i] + " 나이:" + studentAges[i] + " 성적:" + studentGrades[i]);
        }

    }
}
```

그러나 배열을 사용했을 때 아쉬운 점도 있다.
한 학생의 데이터가 3개의 배열에 나뉘어 존재한다는 것이다.
따라서 그 학생의 데이터를 변경하기 위해서는 3개의 배열을 건들여야한다는 것이다.
추가적으로 학생들의 인덱스를 모두 맞춰주어야하는 번거러움도 존재한다.
함께 변경 시 실수할 가능성도 증가한다.
<br><br>
사람이 관리하기에 좋은 방식은 무엇일지 생각해보아야 한다.
그래서 도입된 것이 클래스 개념이다.

클래스를 사용해서 학생이라는 개념을 만들고, 각각의 학생별로 정보를 기입해주는 것이다.
그 정보가 이름, 나이, 성적이라 할 때