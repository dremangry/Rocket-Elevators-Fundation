# Rocket Elevators Fundation: Ruby on Rails <!-- omit in toc -->

## Table of Contents <!-- omit in toc -->

- [Project Description](#project-description)
- [Project Requirements](#project-requirements)
- [Credits](#credits)

## Project Description
The main purpose of this project is to put in practice everything leadned in the past weeks.
To try it, log in and click on intervention and create a intervention the information will be displayes in the admin.


## Project Requirements

### 1. A Intervention Request Form and AJAX 
create the intervention form in the view through a scafold in the terminal and create a js file with the AJAX function in order to display
the demanded information for a intervention in a dropdown.

### 2. New "Interventions" Table
Create a migration with the iformation provided in the documentation for intervention.

### 3. Creating a Ticket in FreshDesk
FreshDesk is a usefull tool to make sure to follow up on every contact, no matter the source of this incomming message. In our case, we use it to send a ticket request if you fill the intervention form.

### 4. Creating new GET and PUT requests in the REST API
Implement the information of put and the get of the rest api through the .net framework (c#) and deploy everything on microsoft azure

To try the API you can create a intervention go on postman paste those endpoint and specify the id
### GET. https://rocketelevatorsweek8.azurewebsites.net/api/intervention/pending
### PUT. https://rocketelevatorsweek8.azurewebsites.net/api/intervention/ChangeStatusToInProgress/
### PUT. https://rocketelevatorsweek8.azurewebsites.net/api/intervention/ChangeStatusToCompleted/


You can see it in the lower right corner of the homepage and of the quote page.

### 3. Access to Back Office (Restricted)
Access to back-end office is restricted to users that were assigned as [employees](https://docs.google.com/spreadsheets/d/1-S0updscUGOpBpFE-2plFBJlVkCseOUuUpp7nu5e-fY/edit#gid=1786076246). Email and password are also required to access the back-end office. To login, simply use the employee's email and using the password that follows the logic of: first letter of first name + first letter of last names + 1234. For example:
  * User example: Francis Patry-Jessop
    * Email: francis.patry-jessop@codeboxx.biz
    * Password: fpj1234
  * User example: Patrick Thibault
    * Email: patrick.thibault@codeboxx.biz
    * Password: pt1234

## Credits

This project was made possible through the support of:

-   Perry Sawatzky
-   Mathieu	Houde
-   Patrick Thibault
-   Francis Patry-Jessop
-   CodeBoxx School of Technology Community

