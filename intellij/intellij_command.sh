# FOR MAC OSX

# 1) OFFICIAL SHORTCUT FOR MAC
# https://www.jetbrains.com/help/rider/Reference_Keymap_Rider_OSX.html#top

# 2) intellJ short cut viddeo
# https://www.youtube.com/watch?v=qxkheCo8oF4&list=PLmOn9nNkQxJH0qBIrtV6otI0Ep4o2q67A&index=410

# 2) find code used in project 
cmd + b

# 3) find where code from originally
shift + shift 

# 4) Start a new project (with JDK8, sbt, scala for example..)
# step 1) open inellj with any project
# step 2) (go to upper menu)
# step 3) File -> New -> Project from existing source -> choose the project u wanna open -> click "import project from external model" and clck "sbt" -> then click "java8 JDK"
# step 4) done. your project shoule be opened and built with intellj now.

# 5) Change font size
# preferences -> Editor -> Font

# 6) format code
# open intellJ and click the script/program you wanna format in the intellJ console
command + option + L

# 7) auto generate getter, setter (java)
# https://www.jetbrains.com/help/idea/generating-code.html#generate-getters-setters
# code -> generate -> getter
# code -> generate -> setter

# 8) Change font size via mouse wheel
# https://www.youtube.com/watch?v=qxkheCo8oF4&list=PLmOn9nNkQxJH0qBIrtV6otI0Ep4o2q67A&index=410
# preference -> Editor -> General -> Mouse control -> Change font size with Command + Mouse wheel

# 9) stackoverflow when build/run
# https://stackoverflow.com/questions/44675448/intellij-idea-stackoverflowerror-on-build-project
# If you are getting the issue in Run/Debug configuration, 
#  -> you can change the same in Run->Edit Configurations->VM parameters: -Xms512M -Xmx1024M -Xss4M -XX:+CMSClassUnloadingEnabled

# 10) auto try-catch-finally (intellJ @ macbook)
# https://stackoverflow.com/questions/2583983/wrap-with-try-catch-in-intellij/2583999
# step 1) select plan-to-change-code
# step 2) "command" + "option" + "t"
# step 3) select "try-catch-finally"
# done !

# 11) delete intellJ (mac)
# https://www.jetbrains.com/help/idea/uninstall.html#standalone
# step 1) delete app under Applications
# step 2) delete cache
ls ~/Library/Caches/JetBrains/

# 12) replace code block (multi-line of code)
# step 1) select lines of code
# step 2) command + shift + r
# step 3) in popup, enter new lines of code
# step 4) click "replace all"
# step 5) done!

# 13) make code as source code / source test...
# solve intellJ error : java file outside of source root
# https://blog.csdn.net/ZHOU_VIP/article/details/117453177
# https://blog.csdn.net/weixin_43876778/article/details/109036140
# step 1) right click Directory
# step 2) Mark Directory as --> Sources Root(tell IntelliJ IDEA，Java文件夹及其子文件夹中包含的源代码，可以编译为构建过程的一部分) (So
# step 3) done

# 14) load different projects under one intelliJ window
# example : https://www.youtube.com/watch?v=tF_Y4G1FovQ&list=PLmOn9nNkQxJESDPnrV6v_aiFgsehwLgku&index=33
# step 1) create a blank directory (e.g. workspace)
# step 2) intelliJ -> "File" -> "New" -> "Project" 
# step 3) "File" -> "New" -> "Module" -> select the project you want to import (location, and remember use jdk 1.8) -> repeat ...
# step 4) done 

# 15) Enable JDK in project
#  File -> project structure -> select your SDK (JDK)

# 16) Init blank project
# https://www.youtube.com/watch?v=tF_Y4G1FovQ&list=PLmOn9nNkQxJESDPnrV6v_aiFgsehwLgku&index=33
# file -> new -> project -> Empty project

# 17) Init modules with spring initializer in project
# NOTE : have to install "sparing initializer" in market place first -> restart intelliJ
# https://www.youtube.com/watch?v=tF_Y4G1FovQ&list=PLmOn9nNkQxJESDPnrV6v_aiFgsehwLgku&index=33
# step 1) new new project
# step 2) with spring initializer
# step 3) select depdency, group name, ..
# step 4) done !

# 18) Open project with multiple modules via IntellJ
# step 1) File -> proejct from existing source -> open project
# step 2) wait till project is loaded
# step 3) load module : File -> module from existing source (choose "maven" as build framework) -> module is loaded
# step 4) repeat above steps ...
# step 5) done!

# 19) intellJ compile module to jar
# https://youtu.be/0yzA8_In-vg?t=271
# maven tool -> mvn package -> compiled jar is in /target path

# 20) intellJ load local modules
# https://github.com/yennanliu/SpringPlayground/tree/main/DownloadServiceV2
# - How to use local modules ?
#     - step 1) add module to pom.xml
#         - https://github.com/yennanliu/SpringPlayground/blob/main/DownloadServiceV2/download-service-api/pom.xml#L21
#         - https://github.com/yennanliu/SpringPlayground/blob/main/DownloadServiceV2/download-service-web/pom.xml#L22
#     - step 2) at intellJ, reload pom.xml (click "wheel")
#     - step 3) then you should be able to import class from local modules
# example
#         <!-- add local module dep -->
#         <dependency>
#             <groupId>org.example</groupId>
#             <artifactId>download-service-api</artifactId>
#             <version>1.0-SNAPSHOT</version>
#         </dependency>
#         <!-- add local module dep -->

# 20') intellJ load local modules V2
# ref video:
#   https://youtu.be/D1pH2Ee88OM?t=385
# ref code:
# https://github.com/yennanliu/SpringPlayground/blob/main/springCloud1/cloud-provider-payment8001/pom.xml#L26
# https://github.com/yennanliu/SpringPlayground/blob/main/springCloud1/cloud-consumer-order80/pom.xml#L17
#         <!--
#         use our own defined module
#         https://youtu.be/D1pH2Ee88OM?t=385
#         -->
#         <dependency>
#             <groupId>com.yen</groupId>
#             <artifactId>cloud-api-commons</artifactId>
#             <version>${project.version}</version>
#         </dependency>

# 21) spring maven enable "hot deployment"
# https://youtu.be/vaTDClYcjIc?t=138

# 22) enable "Run Dashboard" -> run multiple services at once
# https://youtu.be/38XoPk5l5DQ?t=429
# step 1) open maven project directory -> .idea -> modify workspace.xml
# if success, can find "Run Dashboard" via : View -> Tool Windows -> Run Dashboard
