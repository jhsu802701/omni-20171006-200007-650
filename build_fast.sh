#!/bin/bash

sh config_env.sh

sh pg_setup.sh

sh kill_spring.sh
sh all.sh
