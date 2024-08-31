

printf "\nExport app URL\n"
export BASE_URL=127.0.0.1:5153
printf $BASE_URL

printf "\nRun health_check curl"
curl $BASE_URL/health_check
printf "\n"

printf "\nRun readiness_check curl\n"
curl $BASE_URL/readiness_check
printf "\n"


# printf "\nRun daily_usage curl"
curl $BASE_URL/api/reports/daily_usage
printf "\n"

# printf "\nVerify DB user_visits"
# curl $BASE_URL/api/reports/user_visits
printf "\n"