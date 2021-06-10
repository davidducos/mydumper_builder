#!/bin/bash
port=3307
empty="/tmp/empty"
mydumper_dir="/mysql/db1"
myloader_dir="/mysql/db2"
log="/tmp/test_mydumper.log"
stor_dir="/tmp/data"
mydumper="/tmp/mydumper/mydumper"
myloader="/tmp/mydumper/myloader"
> $log

rebuild_database (){
  datadir="$1"
  echo "Cleaning up previous run"
  mysqladmin --no-defaults shutdown --socket=${datadir}/mysql.socket 1> /dev/null 2>&1
  rm -rf $datadir
  echo "Initializing database"
  mkdir -p $datadir
  mysqld --no-defaults --datadir=$datadir --port=$port --socket=${datadir}/mysql.socket -u mysql --log-error=${datadir}/mysqld.log --initialize-insecure
  mysqld --no-defaults --innodb-buffer-pool-size=33554432 --datadir=$datadir --port=$port --socket=${datadir}/mysql.socket -u mysql --log-error=${datadir}/mysqld.log --daemonize
  port=$(( $port + 1 ))
}


test_case (){
  # Test case
  # We should consider each test case, with different mydumper/myloader parameters
  s=$*

  mydumper_parameters=${s%%"--"*}
  myloader_parameters=${s#*"--"}

  if [ "${mydumper_parameters}" != "" ]
  then
    # Prepare
    rm -rf ${stor_dir}
    mkdir -p ${stor_dir}
    # Export
    echo "Exporting database: ${mydumper_parameters}"
    eval $mydumper --defaults-file="$empty" -M -v 4 -L $log --socket=${mydumper_dir}/mysql.socket -B ${DATABASE} -o ${stor_dir} ${mydumper_parameters}
    error=$?
    if (( $error > 0 ))
    then
      echo "Error running: $mydumper --defaults-file="$empty" -M -v 4 -L $log --socket=${mydumper_dir}/mysql.socket -B ${DATABASE} -o ${stor_dir} ${mydumper_parameters}"    
      exit $error
    fi
  fi
  # Import
  echo "Importing database: ${myloader_parameters}"
  eval $myloader --defaults-file="$empty" -v 4 -L $log --socket=${myloader_dir}/mysql.socket -d ${stor_dir} ${myloader_parameters}
  error=$?
  if (( $error > 0 ))
  then
    echo "Error running: $myloader --defaults-file="$empty" -v 4 -L $log --socket=${myloader_dir}/mysql.socket -d ${stor_dir} ${myloader_parameters}"
    exit $error
  fi
}

rebuild_database "${mydumper_dir}"
rebuild_database "${myloader_dir}"

# IMPORT DATA .sql
DATABASE="myd_test"
FILE="/root/test/mydumper_aipk_uuid.sql"

echo "CREATE DATABASE IF NOT EXISTS ${DATABASE};" | mysql --no-defaults --socket=${mydumper_dir}/mysql.socket
echo "CREATE DATABASE IF NOT EXISTS ${DATABASE};" | mysql --no-defaults --socket=${myloader_dir}/mysql.socket

echo "Import testing database in ${FILE}"
mysql --no-defaults $DATABASE --socket=${mydumper_dir}/mysql.socket < ${FILE}

test_case -r 1000 --
test_case -r 10000 -- -o
test_case -F 10 -- -o
test_case -F 100 -- -o
test_case -c -- -o
test_case -s 2000000 -- -o
test_case -T mydumper_aipk_uuid -- -o
