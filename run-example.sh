#! /bin/sh

# run both 4pcs and super4pcs on the hypo model.
# parameters are optimised to get an accurate alignement of the two models
# -o input estimated overlap in [0,1]
# -d delta, used to compute the LCP between the two models
# -t maximum computation time in seconds
# -n number of samples used for the matching
time -p ./build/Super4PCS -i hippo1.obj hippo2.obj -o 0.7 -d 0.01 -t 1000 -n 400 -r super4pcs_fast.obj -m mat_super4pcs_fast.txt
time -p ./build/Super4PCS -i hippo1.obj hippo2.obj -o 0.75 -d 0.001 -t 1000 -n 4000 -r super4pcs_extreme.obj -m mat_super4pcs_extreme.txt
time -p ./build/Super4PCS -i hippo1.obj hippo2.obj -o 0.7 -d 0.01 -t 1000 -n 400 -r 4pcs.obj -x -m mat_r4pcs.txt


# part in whole matching
# here the overlap parameter is computed relatively to the size of hippo2_sub.obj 
time -p ./build/ Super4PCS -i hippo1.obj hippo2_sub.obj -o 0.7 -d 0.01 -t 1000 -n 200
