counter=2
for year in {2010..2019}
do
  for month in {1..12}
  do
    for day in {1..31}
    do
    PYTHONPATH="." AWS_PROFILE=luigi_dpa luigi --module luigi_orchestration_ec2 Task_70_mlPreproc --local-scheduler --year $year --month $month --day $day --parte $counter
    counter=$((counter+1)) # para "parte" en el nombre del archivo
    sleep 0.5s
    done
  done
done
