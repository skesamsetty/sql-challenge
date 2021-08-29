# sql-challenge

This is analysis done on the employees database of the company Pewlett Hackard. The employees in the database were hired between 1985 and 2000.

As part of this analysis, I have created 6 new tables:   
3 master tables
- Employee : Holds the list of employees and employee infomration like title, date of birth, hire date, etc.
- Title : Holds the list of titles in the company and the corresponding codes.
- Department : Holds the list of departments in the company and the department IDs.

3 fact tables
 - Employee Salary : Holds the employee's salary data.
 - Department Employee : Holds the list of employees of each department.
 - Department Manager : Holds the managers of each department.

To access the data from jupyter notebook, one needs configure username and password in a "config.py" file and save it in the folder "code". Just add 2 lines as below to the config.py file:  

    username='username'  
    password='password'

Since there are no null values in the current data even after the join, I have commented out the fillna logic. Depending upon the business requirement, this would be updated.

Based on the analysis done as part of Jupyter notebook, we can see 

- the most common salary range of employees to be between 40,000 USD and 50,000 USD.
- there are 7 job titles in the company with the average salary of Staff and Senior Staff being almost same.