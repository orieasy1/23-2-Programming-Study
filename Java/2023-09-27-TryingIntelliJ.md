<h3>Intellij로 JSP 개발을 위한 설정</h3>

늘 이클립스만 써오다가 이번에 처음 개발환경을 바꿔보는거라 어려움이 있었다..
진짜 지난주부터 시작했어야하는 건데... 미루고 미루다보니 이렇게 늦어져있다..

<h3>시작</h3>
이클립스에서는 프로젝트를 생성할 때 다이나믹 웹 프로젝트를 클릭하면 바로 만들어지는데 intellij는 또 방식이 달랐다.
sts로 작업할 때는 spring 공부할 때야 메이븐 프로젝트로 코딩했던 것 같은데..
<br><br>
intellij에서 동적 웹 프로젝트를 생성하기 위해서는 먼저 Maven을 클릭한 다음에 archetype(아키텍쳐 타입)을 webapp으로 설정하고 프로젝트를 생성해준다.

<br>

**한글관련 설정** <br> 
이후 Help > edit custom VM Options를 클릭해서 한글 관련 설정을 입력해준다.

-Dfile.encoding=UTF-8 이라는 설정이 작성되어 있는지 확인하고 없으면 추가해주도록 한다.

이러한 셋팅을 새로한 경우에는 재시작을 해주도록한다.
file > Invalidate Caches > Just restart를 클릭하면 좀 더 편하게 재시작을 할 수 있다.

<br>

**plugins에서 Smart Tomcat, lombok 설치** <br>
컴퓨터에 톰캣을 따운 받았다고 해서 톰캣이 인텔리제이에 적용이 된 것은 아니다.
이를 연결해주는 작업을 해야한다.
<br><br>
Settings > plugins 을 클릭해서 창을 열어준다.
<br><br>
추가) plugins 창에서는 다음과 같은 것들을 할 수 있다.
프로그래밍 언어와 관련된 플러그인을 설정하면 해당 언어에 대한 문법 하이라이팅, 코드 자동 완성 및 디버깅 지원을 받을 수 있다.
또 다양한 웹 및 애플리케이션 프레임웤를 지원하는 플러그인을 서치하여 개발 작업을 간편한게 할 수 있다. 
이 외에도 git과 같은버전 관리 시스템 통합, 빌드 및 배포 도구 지원, 데이터베이스 지원 등을 설정 및 관리할 수 있다.
<br>
여러 플러그인들 중에서 lombok이 설치되어있는지 확인하고, Smart Tomcat을 설치해준다.
Smart Tomcat은 개발자의 편의를 위해 특별히 설계된 인텔리제이 플러그인이다.

설치가 완료되면 인텔리제이를 꼭 다시 시작할 수 있도록 한다.

**프로젝트에 톰캣 등록** <br>
Run > Edit Configuration > +버튼 > Smart Tomcat 에 들어가서 다운 받아 두었던 톰캣파일을 등록해준다.
그리고 디렉토리가 web-app으로 되어있는지 확인해 줄 것.
그리고 추가적으로 포트번호를 8081로 변경해주었다.

이후 프로젝트를 실행시키면 웹에서 우리가 코딩한 내용을 확인할 수 있다.
자동으로 생성되는 index.jsp의 코드를 수정한 후 정상적으로 작동되는지 확인하는 작업을 진행하였다.

<br>

위 방법은 무료버전에서 하는 것 같고..
내가 사용하는 유료버전에서는 다음과 같은 방법을 사용을 보통 사용하는 것 같다. <br>
Run > Edit Configuration > +버튼 > Tomcat Server > Local 

<img width="793" alt="image" src="https://github.com/orieasy1/2023-2-WebStudy-backend/assets/129071350/29eb5e09-a61f-46c9-a1ca-9e2c6730f760">

그럼 위에 처럼 밑부분에 Warning: No artifacts marked for deployment라는 에러가 뜰 수 있다.
그러면 오른쪽에 위치한 fix 버튼을 눌러 deployment를 설정해주도록한다.
둘 중 mvn-tomcat-webapp: war exploded를 선택해주면

<img width="780" alt="image" src="https://github.com/orieasy1/2023-2-WebStudy-backend/assets/129071350/94497264-49e4-41f7-8832-b520c66dbf45">

다음과 같은 창이 뜨게 되는데 그럼 오류가 해결된 것이다.
<br><br>
위 사진처럼 Application context를 그대로 두면 프로젝트를 실행할 때 저 주소를 다 쳐야함으로 그냥 /로 수정하여 localhost:8081로 접속할 수 이도록 해준다.

충돌을 방지하기 위하여 포트번호를 8080에서 8081로 바꾸었다.

<br><br>

<h3>오류 발생 및 해결을 위한 몸부림 1 : Tomcat 서버 실행 오류 발생</h3>
연동을 끝내고 프로젝트를 시작하고 로컬호스트에 띄우려는데.. 또 오류가 발생했다.<br>
왤케 나는 오류가 자주 발생하는 거지... <br>
처음에는 server.xml을 찾을 수 없다는 거였고 두번째는 jar파일을 찾을 수 없다는 것이었다.
<br><br>
그래서 apache tomcat 폴더의 conf 폴더에 들어가서 살펴보니까 server.xml, context.xml 등등 파일이 하나도 없었다.. <br>
이유는 모르겠지만... 그래서 일단 지우고 톰캣 사이트에 들어가서 다시 다운받았다. <br>
다운받은 뒤 conf 폴더에 파일들이 다 있는 걸 확인하고 다시 연동해서 실행하니까 작동되었다.
아마도 다운로드 과정에서 문제가 발생하지 않을까?

<br><br>

<h3>톰캣에 대하여</h3>
톰캣은 이미 완성된 자바 프로그래밍이라고 볼 수 있다.
웹프로그래밍을 위해서는 통신, 쓰레드 등 필요한 기능들이 있다.
이 기능들은 그냥 만들어진 것을 가져다가 사용하면된다.
굳이 우리가 만들 필요가 없다는 뜻이다.
<br><br>
예를 들어서 요리를 할 때 요리도구를 우리가 만들 필요 없이 사서 사용하면 되는 것과 갔다.
주요 핵심 조리 과정이 우리가 코드를 짜는 것, 톰캣을 요리도구라고 볼 수 있다.
<br><br>
톰캣이 있으면 모듈이라는 것이 있는데,  모듈안에는 서블릿들이 들어 있다.
우리가 만든 프로젝트가 톰캣 입장에서는 하나의 모듈인 것이다.
모듈안에서는 서블릿이라는 특수한 형태의 클래스가 로딩이 된다.

이해를 위해 다음과 같이 나타낼 수 있는데 <br>

톰캣
 - 모듈(JSP_Project)
   - 서블릿
   - 서블릿
   - 서블릿
 - 모듈
 - 모듈
 - 모듈

이것들이 합쳐지면 포트번호를 8081로 설정해두었으니까 만약 서블릿 이름이 hello라면 

**http://localhost:8081/JSP_Project/hello** 가 될 것이다.

이를 위해 자바 파일을 작성해야한다. <br>
New > Directory > java 를 클릭하면 자바 디렉토리가 생성된다.
거기서 다시 자바 파일을 추가해주도록 한다. (그냥 main 파일을 작성해주었다)

<br>
어노테이션 중에 @WebServlet("/hello")가 있는데 web.xml 파일을 사용하지 않고도 서블릿을 선언하고 url 매핑을 설정할 수 있도록 한다.
class 수준에서 사용되는 어노테이션이다.
톰캣이 건물주라면 우리가 작성하는 프로젝트는 그 건물의 입주민으로 생각하면 된다.

<br><br>

<h3>pom.xml 설정</h3>
Maven Repository 사이트에 들어가서 Jakarta Servlet을 검색한 뒤 6.0버전을 클릭해 복사한 후 pom.xml에 입력해준다.
옆에 M과 동그란 창이 뜨는데 그 것을 클릭해줘야 우리 프로젝트에 적용이 된다.

위 코드를 포함해 3가지를 pom.xml에 설정해주려고 한다.
servlet-api, servlet.jsp-api, servlet.jsp.jstl이 설정 사항이다.
거기에 Maven 플러그인 설정을 해줘야한다.

이클립스에서 spring을 공부하면서 maven project를 처음 만져봤는데 intellij에서 JSP 웹 애플리케이션을 개발하려면 Maven을 사용하여 프로젝트를 설정해야하기에 이클립스에서 했던 것과 비슷한(같은) 과정이 필요한 것이다.
<br><br>
다음은 작성한 pom.xml 코드이다.

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>org.example</groupId>
  <artifactId>Servlet_Prj</artifactId>
  <packaging>war</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>Servlet_Prj Maven Webapp</name>
  <url>http://maven.apache.org</url>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>

    <!-- https://mvnrepository.com/artifact/javax.servlet/javax.servlet-api -->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>javax.servlet-api</artifactId>
      <version>4.0.1</version>
      <scope>provided</scope>
    </dependency>

    <!-- https://mvnrepository.com/artifact/javax.servlet.jsp/javax.servlet.jsp-api -->
    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>javax.servlet.jsp-api</artifactId>
      <version>2.3.3</version>
      <scope>provided</scope>
    </dependency>


    <!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>jstl</artifactId>
      <version>1.2</version>
    </dependency>
  </dependencies>
  <!-- Maven 플러그인 설정 -->
  <build>
    <finalName>Servlet_Prj</finalName>
    <plugins>
      <!-- Maven Compiler Plugin 설정 -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <source>17</source> <!-- Java 버전 -->
          <target>17</target> <!-- Java 버전 -->
        </configuration>
      </plugin>
      <!-- Maven War Plugin 설정 -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-war-plugin</artifactId>
        <version>3.3.1</version>
        <configuration>
          <warSourceDirectory>src/main/webapp</warSourceDirectory>
        </configuration>
      </plugin>
    </plugins>
  </build>

</project>
```

<br><br>

<h3>오류 발생 및 해결을 위한 몸부림2 : 404 에러</h3>
나를 또 힘들게 했던 친구는 처음 프로젝트를 생성할 때 만들어지는 index.jsp를 삭제하면... 그 뒤에 만든 다른 파일을 run 시켰을 때 서버와 연결이 안되고 자꾸 404 에러가 떴다.
<br>
또 분명 매핑까지 해서 서블릿 페이지를 작성했는데 localhost:8081뒤에 /hello를 붙이면 자꾸 에러가 떴다.
<br>
왜 그럴까 고민하다가 web.xml을 확인해보았더니 설정이 전혀 안되어있었다..
servlet 등록도 안해놓았고...

첫 번째 문제가 발생했을 시점에는 사실 까먹고 maven repository에서 관련 설정을 들고와서 pom.xml에 입력을 하는 것을 까먹었다.
관련 사항을 입력해 줘야 제대로 된 jsp 개발을 할 수 있는데 이 부분을 안해줬기 때문이다.
설정을 안해줬는데 제대로 작동할리가..
<br><br>
그래서 위에서 입력한 사항 처럼 작성해줬는데도 자꾸 오류가 발생했다.
어디서 문제가 발생했는지 아예 모르겠어서 톰캣 conf 파일 속에 있는 web.xml을 열어보았다.

```
<web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd"
  version="6.0">
```

라는 코드가 있어서 intellij의 web.xml에도 똑같이 입력해주고 pom.xml에도 maven repository에 다시 접속해서 같은 버전의 코드를 복사 붙여넣기해서 수정을 해주었더니 404오류가 해결되었다.

<br>

**최종 pom.xml 코드**

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>org.example</groupId>
  <artifactId>Servlet_Prj</artifactId>
  <packaging>war</packaging>
  <version>1.0-SNAPSHOT</version>
  <name>Servlet_Prj Maven Webapp</name>
  <url>http://maven.apache.org</url>
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>

    <!-- https://mvnrepository.com/artifact/jakarta.servlet/jakarta.servlet-api -->
    <dependency>
      <groupId>jakarta.servlet</groupId>
      <artifactId>jakarta.servlet-api</artifactId>
      <version>6.0.0</version>
      <scope>provided</scope>
    </dependency>


    <!-- https://mvnrepository.com/artifact/javax.servlet.jsp/javax.servlet.jsp-api -->
    <dependency>
      <groupId>javax.servlet.jsp</groupId>
      <artifactId>javax.servlet.jsp-api</artifactId>
      <version>2.3.3</version>
      <scope>provided</scope>
    </dependency>


    <!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>jstl</artifactId>
      <version>1.2</version>
    </dependency>
  </dependencies>
  <!-- Maven 플러그인 설정 -->
  <build>
    <finalName>Servlet_Prj</finalName>
    <plugins>
      <!-- Maven Compiler Plugin 설정 -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <source>17</source> <!-- Java 버전 -->
          <target>17</target> <!-- Java 버전 -->
        </configuration>
      </plugin>
      <!-- Maven War Plugin 설정 -->
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-war-plugin</artifactId>
        <version>3.3.1</version>
        <configuration>
          <warSourceDirectory>src/main/webapp</warSourceDirectory>
        </configuration>
      </plugin>
    </plugins>
  </build>

</project>
```

<br>

이렇게 pom.xml에 작성해주고 java 파일에 HelloServlet을 다음과 같이 만든 뒤

```java
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); //들어오는 데이터를 UTF-8로 해석하겠다.
        resp.setCharacterEncoding("UTF-8"); //완성되는 HTML의 인코딩을 UTF-8로 하겠다.
        resp.setContentType("text/html; charset-utf-8"); //브라우저에게 우리가 만든 결과물이 UTF-8이라고 알리는 의미
        //이렇게 해두면 한글이 안깨진다.

        resp.getWriter().append("안녕하세요!");
    }
}
```

web.xml 파일에 이렇게 작성해주고

```xml
<web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee
                      https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd"
         version="6.0">

    <servlet>
        <servlet-name>helloServlet</servlet-name>
        <servlet-class>HelloServlet</servlet-class>
    </servlet>
</web-app>
```

다시 run을 돌리면.. 드디어 밑과 같은 페이지가 나온다.

<img width="358" alt="image" src="https://github.com/orieasy1/2023-2-WebStudy-backend/assets/129071350/f1a4f857-ceed-4054-868f-038245d468d9">

<br><br>

