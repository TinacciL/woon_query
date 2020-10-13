#!/bin/bash
#Author: Joan ENRIQUE-ROMERO
#Date:   %d_%m_%Y
#OAR -n C5H6_1Ap
#OAR -O G16.%jobid%.o
#OAR -E G16.%jobid%.e
#OAR -l /nodes=1/core=24,walltime=20:00:00
#OAR --project docgrains


source /applis/site/env.bash
source /applis/site/cecic/gaussian16/env_g16.sh B.01/nehalem 


echo ${OAR_JOB_ID} == $(date) == C5H6_1Ap.com >> /home/tinaccil/launched_jobs.txt
MY_INPUT_DIR=/home/tinaccil/mol_todo/C5H6
MY_OUTPUT_DIR=/home/tinaccil/mol_todo/C5H6
MY_INPUT_FILE=C5H6_1Ap.com
MY_OUTPUT_FILE=C5H6_1Ap.log


MY_SCRATCH_DIR=/bettik/tinaccil/g16

echo MY_SCRATCH_DIR=${MY_SCRATCH_DIR}
[ -d ${MY_SCRATCH_DIR} ] || mkdir -p ${MY_SCRATCH_DIR};
MY_JOB_SCRATCH_DIR=${MY_SCRATCH_DIR}/${OAR_JOB_ID}_C5H6_1Ap
mkdir -p ${MY_JOB_SCRATCH_DIR}

echo MY_JOB_SCRATCH_DIR=${MY_JOB_SCRATCH_DIR}
cp -r ${MY_INPUT_DIR}/*.* ${MY_JOB_SCRATCH_DIR}

#-- Go to scratch dir --#
cd ${MY_JOB_SCRATCH_DIR}

#-- Run Gaussian --#
g16 < ${MY_INPUT_FILE} >${MY_OUTPUT_FILE}
mv ${MY_JOB_SCRATCH_DIR} ${MY_OUTPUT_DIR}/${OAR_JOB_ID}.C5H6_1Ap
cd ${MY_OUTPUT_DIR}
rm -f G16.${OAR_JOB_ID}.o G16.${OAR_JOB_ID}.e
