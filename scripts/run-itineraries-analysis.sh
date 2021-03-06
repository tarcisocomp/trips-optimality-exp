#!/bin/bash


if [ "$#" -lt 5 ]; then
    echo "Wrong number of parameters"
	echo "Usage:"
	echo "./run-spark-scripts.sh <script_path> <od_matrix_folderpath> <buste_data_folderpath>  <otp_server_url> <results_folderpath>"

else

	script_path=$1
	od_matrix_folderpath=$2
	buste_data_folderpath=$3
	otp_server_url=$4
	results_folderpath=$5


	for f in $buste_data_folderpath/*
	do
		filename=${f##*/} # will drop begin of string upto last occur of `SubStr`
		#date=${filename%_*}  # will drop part of string from last occur of `SubStr` to the end
		formatted_date=${filename//_/-}
			echo "Processing date $formatted_date ..."
		time python $script_path $formatted_date $od_matrix_folderpath $buste_data_folderpath $otp_server_url $results_folderpath
	 
	done

	echo "Done!"

fi
