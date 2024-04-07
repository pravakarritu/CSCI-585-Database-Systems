/*

I have used mysql to execute this SQL command.

*/


 
 SELECT DISTINCT(NAME),PHONE, TABLE_3.AMOUNT_SPONSERED
 FROM SPONSER S,(SELECT TABLE_1.SPONSER_ID AS SPONSER_ID, TABLE_1.AMOUNT_SPONSERED AS AMOUNT_SPONSERED
 FROM ((SELECT SPONSER_ID,SUM(AMOUNT_SPONSERED) AS AMOUNT_SPONSERED FROM SPONSER GROUP BY SPONSER_ID)) AS TABLE_1,
 (SELECT MAX(AMOUNT_SPONSERED) AS AMOUNT_SPONSERED FROM (SELECT SPONSER_ID,SUM(AMOUNT_SPONSERED) AS AMOUNT_SPONSERED FROM SPONSER GROUP BY SPONSER_ID) AS TABLE_4) AS TABLE_2
 WHERE TABLE_1.AMOUNT_SPONSERED=TABLE_2.AMOUNT_SPONSERED) AS TABLE_3
 WHERE S.SPONSER_ID=TABLE_3.SPONSER_ID;


/*


In the first subquery where I am creating TABLE_4, I get the total amount sponsored by each sponsor. In TABLE_2, I am finding the maximum amount sponsored in TABLE_4. In the third subquery, I get details of all sponsors grouping them by SPONSER_ID. In the fourth subquery, I get details of the sponsor where the total amount sponsored by the sponsor equals the maximum total amount. The final query displays the sponsor's name, phone number, and total amount sponsored. Distinct will display the unique sponsors with the highest total amount sponsored.

*/
