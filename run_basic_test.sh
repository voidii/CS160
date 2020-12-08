# quick smoke test, do you seg fault everywhere or get the correct ouputs?

for i in tests/*.exe
do
    echo "running $i\n"
    $i 200000
done
