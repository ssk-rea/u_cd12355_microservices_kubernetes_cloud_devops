

printf "\nExport app URL\n"
# export BASE_URL=127.0.0.1:5153
export BASE_URL=ab205e63d7771448dad215c9e8368b23-1227939832.us-east-1.elb.amazonaws.com:5153
printf $BASE_URL

printf "\nRun health_check curl\n"
curl $BASE_URL/health_check
printf "\n"

printf "\nRun readiness_check curl\n"
curl $BASE_URL/readiness_check
printf "\n"


printf "\nRun daily_usage curl\n"
curl $BASE_URL/api/reports/daily_usage
printf "\n"

printf "\nVerify DB user_visits"
curl $BASE_URL/api/reports/user_visits
printf "\n"