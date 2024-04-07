/*

I have used mysql to execute this SQL command.

*/
 
 SELECT VIDEOS.TITLE, VIDEO_CHANNEL.NAME AS CHANNEL_NAME, (VIDEO_STATISTICS.LIKES/VIDEO_STATISTICS.VIEWCOUNT) AS RATIO_OF_LIKES_TO_VIEWS
 FROM STATISTICS VIDEO_STATISTICS,VIDEO VIDEOS, CHANNEL VIDEO_CHANNEL
 WHERE VIDEO_STATISTICS.VIDEO_ID=VIDEOS.VIDEO_ID AND VIDEOS.CHANNEL_ID=VIDEO_CHANNEL.CHANNEL_ID AND VIDEO_CHANNEL.CHANNEL_ID IN 
 (SELECT CHANNEL_ID FROM CHANNEL WHERE OWNER IN (SELECT USER_ID FROM VIDEO_CREATOR WHERE USER_ID IN (SELECT USER_ID FROM USER WHERE NAME LIKE '%Marvel Entertainment%' AND USER_IS_VIDEO_CREATOR=1))) ORDER BY TITLE ASC;
 
 
/*


The first subquery finds the users' names with the words "Marvel Entertainment" in them. The subtype discriminant used here is USER_IS_VIDEO_CREATOR. The second subquery finds the user_id of these(users with the word "Marvel Entertainment") from the video_creator table since these users must be content creators to own the channel. The third subquery finds the channel ids associated with these users. And the final query finds the statistics of videos in these channel ids. The ratio of likes to views is then found using the details from the statistics table.

The users USER_ID_4, USER_ID_6, and USER_ID_7 have the word Marvel Entertainment in them. USER_ID_4 owns channels 5 and 6. USER_ID_6 and USER_ID_7 do not own any channel. Channel 5 has VIDEO_ID_7,VIDEO_ID_8, VIDEO_ID_9,VIDEO_ID_10,VIDEO_ID_11, VIDEO_ID_12,VIDEO_ID_13,VIDEO_ID_14, VIDEO_ID_15,VIDEO_ID_16. The results are ordered in ascending order of the video's title, which is of type VARCHAR here.


*/





