/*

I have used mysql to execute this SQL command.

*/

SELECT TABLE_2.TITLE, VIDEO_CHANNEL.NAME AS CHANNEL_NAME, (TABLE_2.LIKES/TABLE_2.VIEWCOUNT) AS RATIO_OF_LIKES_TO_VIEWS
FROM CHANNEL VIDEO_CHANNEL, (SELECT LIKES,VIEWCOUNT,TABLE_1.CHANNEL_ID,TABLE_1.TITLE FROM STATISTICS, (SELECT VIDEO_ID, CHANNEL_ID,TITLE FROM VIDEO 
WHERE UPLOADER_ID IN (SELECT USER_ID FROM VIDEO_CREATOR WHERE NAME LIKE '%Marvel Entertainment%')) AS TABLE_1 WHERE TABLE_1.VIDEO_ID=STATISTICS.VIDEO_ID) AS TABLE_2
WHERE TABLE_2.CHANNEL_ID=VIDEO_CHANNEL.CHANNEL_ID
ORDER BY TABLE_2.TITLE ASC;


/*

The first subquery returns video_creators who have 'Marvel Entertainment' in them. The second subquery returns video details of videos owned by these users in TABLE_1. This result is referenced as TABLE_1. The third subquery finds the statistics of these videos. This result is referenced as TABLE_2. The final query gets the details of the channel these users own and which has the videos in TABLE_2.

The users USER_ID_4, USER_ID_6, and USER_ID_7 have the word Marvel Entertainment in them. USER_ID_4 owns channels 5 and 6. USER_ID_6 and USER_ID_7 do not own any channel. Channel 5 has VIDEO_ID_7,VIDEO_ID_8, VIDEO_ID_9,VIDEO_ID_10, VIDEO_ID_11,VIDEO_ID_12, VIDEO_ID_13,VIDEO_ID_14, VIDEO_ID_15,VIDEO_ID_16. The results are ordered in ascending order of the video's title, which is of type VARCHAR here.

*/












