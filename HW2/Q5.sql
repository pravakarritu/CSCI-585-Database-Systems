/*

I have used mysql to execute this SQL command.

*/

SELECT TABLE_6.TITLE AS VIDEO_TITLE, TABLE_5.MINIMUM_AGE_OF_VIEWERS, TABLE_5.MAXIMUM_AGE_OF_VIEWERS
FROM (SELECT DISTINCT(TABLE_3.TITLE) AS TITLE
FROM VIEWS V_3, (SELECT V_1.VIDEO_ID,V_1.TITLE FROM STATISTICS S_1, VIDEO V_1
WHERE S_1.NUMBER_OF_COMMENTS=(SELECT MAX(TABLE_1.NUMBER_OF_COMMENTS)
FROM (SELECT S.NUMBER_OF_COMMENTS,S.VIDEO_ID, V.TITLE
FROM STATISTICS S, VIDEO V WHERE S.VIDEO_ID IN (SELECT V.VIDEO_ID FROM VIDEO V, CHANNEL C WHERE V.CHANNEL_ID=C.CHANNEL_ID AND C.OWNER IN (SELECT USER_ID FROM VIDEO_CREATOR WHERE NAME='Taylor Swift'))
AND V.VIDEO_ID=S.VIDEO_ID) AS TABLE_1) AND V_1.VIDEO_ID=S_1.VIDEO_ID) AS TABLE_3
WHERE V_3.VIDEO_ID=TABLE_3.VIDEO_ID) AS TABLE_6,
(SELECT MIN(AGE) AS MINIMUM_AGE_OF_VIEWERS ,MAX(AGE) AS MAXIMUM_AGE_OF_VIEWERS
FROM USER U, (SELECT USER_ID AS USER_ID, TABLE_3.TITLE AS TITLE
FROM VIEWS V_3, (SELECT V_1.VIDEO_ID,V_1.TITLE FROM STATISTICS S_1, VIDEO V_1
WHERE S_1.NUMBER_OF_COMMENTS=(SELECT MAX(TABLE_1.NUMBER_OF_COMMENTS)
FROM (SELECT S.NUMBER_OF_COMMENTS,S.VIDEO_ID, V.TITLE
FROM STATISTICS S, VIDEO V WHERE S.VIDEO_ID IN (SELECT V.VIDEO_ID FROM VIDEO V, CHANNEL C WHERE V.CHANNEL_ID=C.CHANNEL_ID AND C.OWNER IN (SELECT USER_ID FROM VIDEO_CREATOR WHERE NAME='Taylor Swift'))
AND V.VIDEO_ID=S.VIDEO_ID) AS TABLE_1) AND V_1.VIDEO_ID=S_1.VIDEO_ID) AS TABLE_3
WHERE V_3.VIDEO_ID=TABLE_3.VIDEO_ID) AS TABLE_4
WHERE TABLE_4.USER_ID=U.USER_ID AND U.USER_IS_VIDEO_CREATOR=1) AS TABLE_5;
		  		     			       	                  
/*

VIEWS stores views for all videos. The first subquery finds the user id of Taylor Swift. The second subquery gets the details of videos and channels owned by Taylor Swift. The third subquery gets the number of comments for all videos in this channel from the STATISTICS table. The third subquery finds the most commented video and its video id. The fourth subquery finds the user ids of users who watched this video. The final query finds the maximum and minimum age of all these users. These details are referenced in TABLE_5. For TABLE_6, the first subquery finds the user id of Taylor Swift. The second subquery gets the details of videos and channels owned by Taylor Swift. The third subquery gets the number of comments for all videos in this channel from the STATISTICS table. The third subquery finds the most commented video and its video id and video title. Finally, the result displays the video title and the minimum and maximum age of viewers who watched the most commented video on Taylor Swift's channel.

*/

