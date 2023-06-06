set -x
set -e
for i in {3..1000}
do
   echo "$i"
  ./arena   submit tfjob  --name="aa-${i}"  --image=python:3.6  "echo 10; echo 99; echo 88"
done
