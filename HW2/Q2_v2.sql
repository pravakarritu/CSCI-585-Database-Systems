/*

I have used mysql to execute this SQL command.

*/

SELECT TABLE_3.TITLE, VIDEO_CHANNEL.NAME AS CHANNEL_NAME , (TABLE_3.LIKES/TABLE_3.VIEWCOUNT) AS RATIO_OF_LIKES_TO_VIEWS
FROM CHANNEL VIDEO_CHANNEL JOIN 
(SELECT LIKES,VIEWCOUNT,TABLE_2.CHANNEL_ID,TABLE_2.TITLE
 FROM STATISTICS JOIN
 (SELECT VIDEO_ID, CHANNEL_ID,TITLE FROM VIDEO 
 JOIN (SELECT USER_ID FROM VIDEO_CREATOR WHERE NAME LIKE '%Marvel Entertainment%') AS TABLE_1 ON VIDEO.UPLOADER_ID=TABLE_1.USER_ID) AS TABLE_2 ON TABLE_2.VIDEO_ID=STATISTICS.VIDEO_ID) AS TABLE_3 ON VIDEO_CHANNEL.CHANNEL_ID=TABLE_3.CHANNEL_ID ORDER BY TABLE_3.TITLE ASC;

/*


In this approach, I am using JOIN to combine tables. In the first join, I am joining the table with video creators with the word Marvel Entertainment in them and the VIDEO table on the uploader id in the user id in the first table. This gives all the details of videos that video creators uploaded with the word 'Marvel Entertainment .'The result of this join is stored in TABLE_2. Next, I am joining TABLE_2 and STATISTICS in column VIDEO_ID. This gives the details of likes and views of videos in TABLE_2. This result is stored in TABLE_3. Finally, I am joining TABLE_3 with CHANNEL on CHANNEL_ID. This gives channel details of all the videos in TABLE_3. 



The users USER_ID_4, USER_ID_6, and USER_ID_7 have the word Marvel Entertainment in them. USER_ID_4 owns channels 5 and 6. USER_ID_6 and USER_ID_7 do not own any channel. Channel 5 has VIDEO_ID_7,VIDEO_ID_8, VIDEO_ID_9,VIDEO_ID_10, VIDEO_ID_11,VIDEO_ID_12, VIDEO_ID_13,VIDEO_ID_14, VIDEO_ID_15,VIDEO_ID_16. The results are ordered in ascending order of the video's title, which is of type VARCHAR here.

*/














