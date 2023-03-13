set -e

#https://mesonet.agron.iastate.edu/cgi-bin/request/asos.py?station=EPWA&data=all&year1=2022&month1=1&day1=1&year2=2023&month2=3&day2=12&tz=Etc%2FUTC&format=onlycomma&latlon=yes&elev=yes&missing=null&trace=T&direct=no&report_type=3&report_type=4

STATION=$1 #"EPWA"
#START_YEAR=$2
#END_YEAR=$3

START_DAY=1
FSTART_DAY=`printf "%02d" ${START_DAY}`

START_MONTH=1
FSTART_MONTH=`printf "%02d" ${START_MONTH}`

START_YEAR=$2 #2022

END_DAY=31
END_MONTH=12
END_YEAR=${START_YEAR}

URL_PREFIX="https://mesonet.agron.iastate.edu/cgi-bin/request/asos.py?"

LOCAL_PREFIX="data/raw/${STATION}/${START_YEAR}"
LOCAL_FILE="${STATION}_${FSTART_DAY}_${FSTART_MONTH}_${START_YEAR}_${END_DAY}_${END_MONTH}_${END_YEAR}.csv"
LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

URL="${URL_PREFIX}station=${STATION}&data=all&year1=${START_YEAR}&month1=${START_MONTH}&day1=${START_DAY}&year2=${END_YEAR}&month2=${END_MONTH}&day2=${END_DAY}&tz=Etc%2FUTC&format=onlycomma&latlon=yes&elev=yes&missing=null&trace=T&direct=no&report_type=3&report_type=4"

mkdir -p ${LOCAL_PREFIX}
wget ${URL} -O ${LOCAL_PATH}

#chmod +x load_data.sh



