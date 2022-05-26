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
