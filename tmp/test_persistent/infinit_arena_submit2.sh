set -x
set -e
for i in {1001..2000}
do
   echo "$i"
  ./arena   submit tfjob  --name="aa-${i}"  --image=python:3.6  "echo 10; sleep 1; echo 88"
done