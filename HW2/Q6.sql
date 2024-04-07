/*

I have used mysql to execute this SQL command.

*/

SELECT U.NAME AS USERNAME, TABLE_9.CHANNEL_NAME, TABLE_9.TOTAL_COUNT AS TOTAL_SUBSCRIBER_COUNT
FROM USER U, (SELECT CHANNEL.OWNER AS OWNER,CHANNEL.NAME AS CHANNEL_NAME, CHANNEL.SUBSCRIPTION_COUNT AS TOTAL_COUNT FROM CHANNEL,
(SELECT DISTINCT(TABLE_7.UPLOADER_ID) AS UPLOADER_ID, TABLE_7.CHANNEL_ID AS CHANNEL_ID
FROM (SELECT UPLOADER_ID,CHANNEL_ID FROM VIDEO WHERE WEEK(UPLOAD_DATE) IN (select WEEK(DATE_ADD(LAST_DAY((DATE('2023-02-25')-INTERVAL 1 MONTH)),INTERVAL -30 DAY)))) AS TABLE_7,
(SELECT UPLOADER_ID,CHANNEL_ID FROM VIDEO WHERE WEEK(UPLOAD_DATE) IN (select WEEK(DATE_ADD(DATE_ADD(LAST_DAY((DATE('2023-02-25')-INTERVAL 1 MONTH)),INTERVAL -30 DAY),INTERVAL 7 DAY)))) AS TABLE_6,
(SELECT UPLOADER_ID,CHANNEL_ID FROM VIDEO WHERE WEEK(UPLOAD_DATE) IN (select WEEK(DATE_ADD(DATE_ADD(LAST_DAY((DATE('2023-02-25')-INTERVAL 1 MONTH)),INTERVAL -30 DAY),INTERVAL 14 DAY)))) AS TABLE_5,
(SELECT UPLOADER_ID,CHANNEL_ID FROM VIDEO WHERE WEEK(UPLOAD_DATE) IN (select WEEK(DATE_ADD(DATE_ADD(LAST_DAY((DATE('2023-02-25')-INTERVAL 1 MONTH)),INTERVAL -30 DAY),INTERVAL 21 DAY)))) AS TABLE_4,
(SELECT UPLOADER_ID,CHANNEL_ID FROM VIDEO WHERE WEEK(UPLOAD_DATE) IN (select WEEK(DATE_ADD(DATE_ADD(LAST_DAY((DATE('2023-02-25')-INTERVAL 1 MONTH)),INTERVAL -30 DAY),INTERVAL 28 DAY)))) AS TABLE_3
WHERE TABLE_3.UPLOADER_ID=TABLE_4.UPLOADER_ID AND TABLE_4.UPLOADER_ID=TABLE_5.UPLOADER_ID AND TABLE_5.UPLOADER_ID=TABLE_6.UPLOADER_ID AND TABLE_6.UPLOADER_ID=TABLE_7.UPLOADER_ID) AS TABLE_8
WHERE CHANNEL.OWNER=TABLE_8.UPLOADER_ID AND TABLE_8.CHANNEL_ID=CHANNEL.CHANNEL_ID) AS TABLE_9
WHERE U.ADDRESS LIKE '%US%' AND TABLE_9.OWNER=U.USER_ID; 

/*

The first subquery returns all the user ids and channel ids of all the users who uploaded videos to that channel in the last week of the month. These results are referenced in TABLE_5. The second subquery returns the user ids and channel ids of all users who uploaded videos to that channel in the fourth week of the month. These results are referenced in TABLE_4. The third subquery returns the user ids and channel ids of all users who uploaded videos in the month's third week in that channel. These results are referenced in TABLE_5. The fourth subquery returns all user ids and channel ids who uploaded videos in the second week in that channel. These results are referenced in TABLE_6. The fifth subquery returns all user ids and channel ids who uploaded videos in the first week in that channel. These results are referenced in TABLE_7. The next query gets the channel details of these channels and user ids. The final query finds all users who live in the US and checks if their user ids are in the user ids returned by the previous subqueries. Assuming last month is January in the above query.



*/



