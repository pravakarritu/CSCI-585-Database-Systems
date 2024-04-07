
/*

I have used mysql to execute this SQL command.

*/
 
 SELECT V.KEYWORDS AS KEYWORD_NAME,AVG(C.SENTIMENT) AS AVERAGE_SCORE
 FROM COMMENT C, INFORMATIONAL_VIDEO V
 WHERE C.VIDEO_ID=V.VIDEO_ID
 GROUP BY V.KEYWORDS
 ORDER BY AVG(C.SENTIMENT) DESC;
 
 
/*

 First, the COMMENT table and INFORMATIONAL_VIDEO table are joined to find the videos with comments. Then, GROUP_BY combines keywords in one category and finds the average sentiment in each group(each category belongs to each keyword). The results are ordered in descending order of the average sentiment of each group, so the highest score is displayed first. 
 

*/
 
 

