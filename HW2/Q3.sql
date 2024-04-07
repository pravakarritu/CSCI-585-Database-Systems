
/*

I have used mysql to execute this SQL command.

*/

SELECT DISTINCT(U.NAME) AS USERNAME,U.EMAIL, TABLE_2.CHANNEL_NAME,TABLE_2.COUNT AS SUBSCRIBER_COUNT
FROM VIDEO_CREATOR U, (SELECT C.OWNER,C.CHANNEL_ID, TABLE_3.COUNT_1 AS COUNT, C.NAME AS CHANNEL_NAME
FROM CHANNEL C,(SELECT CHANNEL_ID AS ID,COUNT(*) AS COUNT FROM SUBSCRIPTION 
WHERE SUBSCRIPTION_TYPE='PAID' GROUP BY CHANNEL_ID) AS TABLE_1, (SELECT CHANNEL_ID AS ID_1, COUNT(*) AS COUNT_1 FROM SUBSCRIPTION GROUP BY CHANNEL_ID) AS TABLE_3
WHERE C.CHANNEL_ID=TABLE_1.ID AND TABLE_1.COUNT>100 AND C.CREATION_DETAILS LIKE '%01.01.2023%' AND TABLE_3.ID_1=TABLE_1.ID) AS TABLE_2
WHERE U.USER_ID=TABLE_2.OWNER;

/*


The first subquery returns the details of the subscription where the subscription type is paid. These details include channel id and the total number of paid subscriptions per channel. These details are referenced as TABLE_1. The second subquery gets the total subscription details of each channel. These details are referenced in TABLE_3. The third subquery finds the details of channels where the paid subscription count is more than 100 for channels created on 01.01.2023. These details are referenced as TABLE_2. TABLE_2 also has the total subscription count of these channels per user. The third subquery returns the details of users who own these channels. The results display the username, email, channel name, and subscriber count. The username of the user is the user's name.


*/

