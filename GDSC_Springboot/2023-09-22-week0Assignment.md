<h1>스프링부트 시작</h1>
9/14일 세션 전 과제에 해당하는 내용이다.
9/14일 세션은 학교축제 때문에 참여할 수 없었고, 9/21 세션 내용을 eclipse로 준비해서 갔는데 IDE가 말썽이어서 intellij로 옮기게 되었다.
<br><br>
intellij에서 Spring Boot를 시작할 때 주의하면 좋을 사항이다.
점프 투스프링 부터 1-05까지 내용을 담고 있다.

<h3>intellij로 Springboot 프로젝트 생성</h3>

**프로젝트 생성** <br>
프로젝트를 생성할 때 좌측을보면 Spring Initializr 메뉴에서 프로젝트의 기본적인 설정을 할 수 있다.
Group ID와 Artifact ID를 작성해주고 프로젝트를 생성해주면 된다.

* Group Id: 프로젝트를 식별할 수 잇는 고유한 이름, 일반적으로 회사 도메인을 거꾸로
* Artifact Id: 프로젝트의 이름, 빌드를 원료하면 .jar파일이 만들어지는데 이를 artifact라 함

Java 언어를 사용하고 프로젝트 타입은 Gradle-Groovy로 설정해주었다.
Gradle-Groovy 프로젝트는 Gradle 빌드 도구와 Groovy 프로그래밍 언어를 사용하여 개발된 프로젝트를 가르킨다.

* Gradle: 자바기반 프로젝트의 빌드, 테스트, 패키징 등을 자동화하는 빌드 도구이다. Groovy 또는 Kotlin을 사용하여 빌드 스크릡트를 작성한다. <br>
	  이런 스크립트를 통해 프로젝트의 종속성 관리, 컴파일, 테스트 실행, 아티패트 생성 등을 구성할 수 있다.
* Groovy는 자바 가상 머신 위에서 실행되는 동적 언어로, 자바와 호환성이 뛰어나고 간결한 문법을 가지고 있다.

<br>
스프링부트 3.0부터는 JDK17 버전 이상만 사용할 수 있다고 한다.
JDK 버전에 주의하도록 하자.

<br><br>

**프로젝트 의존성 선택** <br>
프로젝트가 생성될 때 라이브러리들을 추가해서 자동으로 다운로드할 수 있다.
우리는 웹 프로젝트를 만들 거기 때문에

* Spring Boot DevTools
* Lombok
* Spring Web

에 체크 표시를 해주면 된다.

<img width="372" alt="image" src="https://github.com/orieasy1/23-2-Programming-Study/assets/129071350/a816508e-e7d0-468b-87ab-b905c19282cf">


<br>

**톰캣 서버 적용방법** <br>
Run > Edit Configurations 클릭

<img width="552" alt="image" src="https://github.com/orieasy1/23-2-Programming-Study/assets/129071350/6be3af2d-c9ab-4538-affa-770ed2845a0c">


<br>Tomcat 중 local을 고르고 포트번호가 중복되지 않도록 8080을 8081로 변경해준다.
위를 보면 artifacts가 configuration되지 않았다고 오류가 뜨는데 그러면 밑의 사진과 같이 artifacts를 설정해주면 된다.

<img width="551" alt="image" src="https://github.com/orieasy1/23-2-Programming-Study/assets/129071350/aa830ce3-601d-43c8-a9bf-4f3f60d0a94a">

이후 HelloController라는 클래스를 만들어 아래와 같은 코드를 입력했는데

```java
package com.mysite.sbb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HelloController {
	@GetMapping("/hello")
	@ResponseBody
	public String hello() {
		return "Hello World!";
	}
}
```

스프링 복습할겸 코드 뜯어보기
* @Controller 어노테이션은 자바클래스를 컨트롤러의 기능을 수행한다는 의미
* @GetMapping("/hello") 어노테이션은 http://localhost:8080/hello라는 URL 요청이 발생하면 hello 메서드가 실행됨을 의미한다. URL과 메소드를 메핑하는 역할을 하는 것이다.
* @ResponseBody 어노테이션은 hello 메서드의 응답 결과가 문자열 그 자체임을 나타낸다. 

<h3>포트번호 관련 의문사항</h3>
Tomcat을 연결시키는 것에 익숙해져 충돌방지를 위해 포트번호를 8081로 바꾸고 http://localhost:8081/hello로 입력헤서 실행시켰었는데 정상적으로 작동하지 않았다.
다시 포트번호를 8080으로 바꾸었더니 정상적으로 작동하였다.
<br><br>
여기 꼭 기억해야할 점은 SpringBoot의 내장 웹서버 포트와 Tomcat으 웹섯버 포트는 서로 독립적으로 설정된다는 점이다.
톰캣의 포트번호를 8081로 변경했다고해도 Spring Boot 애플리케이션의 내장 웹서버 포트 번호에는 영향을 미치지 않는다.
<br>

**Spring Boot 애플리케이션의 내장 웹 서버 포트번호를 설정하려면** application.properties 또는 application.yml 파일에 해당 포트 번호를 지정해야한다.
나는 application.properties를 사용하므로 server.port=8081이 코드를 추가적으로 입력해주면 된다.
<br><br>
Spring Boot를 사용하는 경우 내장 웹서버(Tomcat,Jetty 또는 Undertow)를 사용하는 것이 기본설정이다. Spring Boot는 이 내장 웹 서버를 통해 웹 애플리케이션을 실행하고 관리하기 때문에 별도로 톰캣에 대한 설정을 하지 않아도 된다.

<br><br>

<h3>Spring Boot 도구 설정하기</h3>

**Spring Boot Devtools** <br>
출력되는 문자열을 변경하더라도 즉 프로그램이 변경 후 URL을 호출하더라도 변경사항이 적용되지 않는다.
<br><br>
프로그램이 변경되더라도 로컬서버가 변경된 클래스를 리로딩하지 않기 때문이다.
이처럼 프로그램을 수정하고 변경된 사항을 확인하려면 매번 서버를 재시작해야한다는 불편함이 있는데 이 문제를 Spring Boot Devtools를 설치해서 해결할 수 있다.
<br><br>
Spring Boot Devtools를 사용하기 위해서는 그레이들로 설치해야한다.
build.gradle을 다음과 같이 수정해준다.

```
plugins {
    id 'java'
    id 'org.springframework.boot' version '3.0.0'
    id 'io.spring.dependency-management' version '1.1.0'
}

group = 'com.mysite'
version = '0.0.1-SNAPSHOT'
sourceCompatibility = '17'

repositories {
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
    testImplementation 'org.springframework.boot:spring-boot-starter-test'
    developmentOnly 'org.springframework.boot:spring-boot-devtools'
}

tasks.named('test') {
    useJUnitPlatform()
}
```

build.gradle 파일의 내용을 적용하려면 refresh를 해줘야한다.

<img width="311" alt="image" src="https://github.com/orieasy1/23-2-Programming-Study/assets/129071350/926df8b9-4127-47da-adab-6ba28ff66f52">


위 사진처럼 오른쪽 코끼리 그림을 찾아 클리하고 sbb에서 우클릭을하여 refresh를 진행시켜준다.
<br><br>
Intellij에서는 사전 설정 옵션이 필요하다. 다음과 같이 진행할 것.

<img width="553" alt="image" src="https://github.com/orieasy1/23-2-Programming-Study/assets/129071350/02a6a03c-c2ac-428e-86c4-9653fea8d2b1">


Build project auto...로 시작하는 사항 체크

<img width="553" alt="image" src="https://github.com/orieasy1/23-2-Programming-Study/assets/129071350/99e660c7-1962-4aeb-9311-55fb4aa1f54d">


Allow auto-make to strat even if... 로 시작하는 사항 체크

<br>
이렇게 해두면 코드 수정 후 저장이 발생할 경우 console 화면에서 서버가 재가동되는 모습을 확인할 수 있다.

<br>

**Lombok 동작 확인** <br>
아래 코드가 이상없이 작동해야 롬복이 제대로 작동하는 것이다.

```java
package com.mysite.sbb;

import lombok.Getter;
import lombok.Setter;

@Getter //hello와 lombok 필드에 대한 getter 메소드 자동 생성
@Setter //hello와 lombok 필드에 대한 setter 메소드 자동 생성
public class HelloLombok {
    private String hello;
    private int lombok;

    public static void main(String[] args) {
        HelloLombok helloLombok = new HelloLombok();    //HelloLombok 클래스의 객체 helloLombok 생성
        helloLombok.setHello("헬로"); //hello 필드에 문자열 설정
        helloLombok.setLombok(5);   //lombok 필드에 정수 설정

        //출력
        System.out.println(helloLombok.getHello());
        System.out.println(helloLombok.getLombok());
    }
}
```

만약 롬복이 빠지게 된다면 코드를 다음과 같이 작성해줘야한다.

```java
package com.mysite.sbb;

public class HelloWithoutLombok {
    private String hello;
    private int lombok;

    public String getHello() {
        return hello;
    }

    public void setHello(String hello) {
        this.hello = hello;
    }

    public int getLombok() {
        return lombok;
    }

    public void setLombok(int lombok) {
        this.lombok = lombok;
    }

    public static void main(String[] args) {
        HelloWithoutLombok helloLombok = new HelloWithoutLombok();
        helloLombok.setHello("헬로");
        helloLombok.setLombok(5);

        System.out.println(helloLombok.getHello());
        System.out.println(helloLombok.getLombok());
    }
}
```

<br>

hello와 lombok 속성에 final을 적용하고 롬복의 @RequiredArgsConstructor 어노테이션을 적용하면 해당 속성을 필요로 하는 생성자가 롬복에 의 자동으로 생성된다.

```java
package com.mysite.sbb;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor    //생성자가 lombok에 의해 자동 생성
public class HelloLombok {
    private final String hello;
    private final int lombok;

    public static void main(String[] args) {
        HelloLombok helloLombok = new HelloLombok("헬로", 5);
        //출력
        System.out.println(helloLombok.getHello());
        System.out.println(helloLombok.getLombok());
    }
}
```

그래서 이렇게 간단히 코드를 작성할 수 있다.
롬복이 제외되면 다음과 같이 코드를 작성해주어야한다.

```java
package com.mysite.sbb;

import lombok.Getter;

@Getter
public class HelloLombok {

    private final String hello;
    private final int lombok;

    public HelloLombok(String hello, int lombok) {
        this.hello = hello;
        this.lombok = lombok;
    }

    public static void main(String[] args) {
        HelloLombok helloLombok = new HelloLombok("헬로", 5);
        System.out.println(helloLombok.getHello());
        System.out.println(helloLombok.getLombok());
    }
}
```

생성자가 추가된 것을 볼 수 있다.
@RequiredArgsconstructor를 사용할 때 final 키워드를 필드에 붙여주는 것은 해당 필드를 불변 필드로 만들어 객체의 불변성을 보장하기 위한 중요한 요소이다.
만약 final 키워드가 없는 필드가 있다면 롬복은 생성자에 해당 필드를 포함하지 않을 것이고 이 필드는 값이 변경가능한 상태를 유지할 것이다.



