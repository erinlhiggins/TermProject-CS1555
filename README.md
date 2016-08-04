# TermProject-CS1555
Term Project for Erin Higgins and Lena Ortmann

All functions are written and explained in project.java.
To run this file, run javac project.java then java project <number of problem>
So for example, to run the createUser function you would run java project 1

For testing purposes and to show test cases use driver.java
To run this file, run javac driver.java then, simply run java driver

The output of the driver java program will show the functionality of our project. 

The file is set up to run on Erin's Oracle account, and if there are issues, please change the username and password in the main of the driver.java file to your username and password and then run the projectschemadata.sql file provided. This should set everything up to work on your personal environment. 

Some logic used:

To send messages to groups and allow people to be in multiple groups at once:
We stored the amount of users in the Group table
Then in the Profile table we have a column named "ingroup" that stores a list of the groups a user is in
When sending messages to a group, it will look through all profiles to find anyone with that group in their list of groups

For anymore information on logic or anything, please email us. 
If any issues, please let us know. 
