#!/bin/sh
python -m robot --outputdir ./logs/ \
                --variablefile variables.py \
                ${ROBOT_ARGS} \
                ${TESTS_PATH}
