# https://stackoverflow.com/questions/33435284/how-to-force-sbt-to-redownload-dependencies-when-ivy-cache-corrupted

# APPROACH 1)
rm -fr ~/.ivy2/cache 
# Or mv ~/.ivy2/cache ~/.ivy2/cache_bk
sbt update

# APPROACH 2)
# empty the ivy cache if you have good network
# rm -rfv ~/.ivy2/cache/*

# or even better just backup it to sync it later on ...
# mv ~/.ivy2/cache ~/.ivy2/cache.`date "+%Y%m%d_%H%M%S`.bak

# remove all sbt lock files
find ~/.sbt ~/.ivy2 -name "*.lock" -print -delete
find ~/.sbt ~/.ivy2 -name "ivydata-*.properties" -print -delete

# remove all the class files
rm -fvr ~/.sbt/1.0/plugins/target
rm -fvr ~/.sbt/1.0/plugins/project/target
rm -fvr ~/.sbt/1.0/target
rm -fvr ~/.sbt/0.13/plugins/target
rm -fvr ~/.sbt/0.13/plugins/project/target
rm -fvr ~/.sbt/0.13/target
rm -fvr ./project/target
rm -fvr ./project/project/target

sbt clean update

# APPROACH 3)
# Try removing the specific dependency that is causing the problem:
rm -rf ~/.ivy2/cache/commons-codec

5) sbt-buildinfo
# https://index.scala-lang.org/sbt/sbt-buildinfo/sbt-buildinfo/0.10.0?target=_2.12_1.0
