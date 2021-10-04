#!/usr/bin/env bash
#
# Script to combine multiple packages downloaded from gStudy, when they contain
# data from the same study.
#
# Courtesy Allen T. Newton, 20211004

echo -e "\n\nWARNING: unzip the packages downloaded from gStudy *before* you proceed. If you need to cancel this script to do that, press [ctrl-c] now. \n\n"


echo -e "What directory contains the raw data folders downloaded from gStudy?" 

read -e directory



    echo -e "\n\n"
    echo "======================================================"
    echo "folders found in $directory:"
    echo -e "\n"
    ls -1 -d "${directory:-.}"*/
    echo "======================================================"
    echo -e "\n"
    echo "Do you wish to merge all folders contained within: $directory?"
    


#read in a yes/no answer, and act accordingly
select yn in "Yes" "No"; do
    case $yn in
        #execute this code if the users confirms that they want to perform a merge
        Yes )
            #first, check to ensure that the input is a directory
            if [[ -d "$directory" ]]
            then
            echo "$directory IS a directory."

            else
            echo "$directory IS NOT a directory. Aborting the merge operation..."
            exit
            fi

		break;;
        #gracefully exit if the user indicates that they DON'T want to perform a merge
        No )
            echo "Aborting merge operation because you selected 'No'. Have a great day!"
            exit;;
    esac
done

if [[ "$yn" == "Yes" ]]
then
    echo "Preparing to merge sub-folders..."
    
    ditto -V "$directory"/* "$directory"/merged/
fi


