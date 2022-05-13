# step 1) install sdk on mac M1
# https://sdkman.io/install
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk

# step 2) install sbt via sdk
# https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Mac.html
sdk install sbt

# step 3) validate 
sbt 
