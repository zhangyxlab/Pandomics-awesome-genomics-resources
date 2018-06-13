for file in ../snps/human/hg19/bed*.sorted.gz; do
  echo $file
  name=$(basename $file)
  join -1 1 -2 4 break_by_traits/Activated_partial_thromboplastin_time <(zcat $file) > $name.test2.out &
done
wait
cat *.test2.out > test2.out
