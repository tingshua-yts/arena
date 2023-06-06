
 ./arena \
  submit \
  tfjob \
  --name="test"
  --image=python:3.6 \
  "echo hello"


arena   submit tfjob --name=test-arena --image=python:3.6 "echo 10; echo 99; echo 88"
