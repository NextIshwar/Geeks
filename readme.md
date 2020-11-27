# GeeksVila Assignment
* This project contains the following features.
* Home screen => Two Buttons is present in this screen. **Employee** button and **Add Employee** button. 
* **Employee** button will navigate the user to a page where user can see the List of Employees. 
* **Add Employee** button will navigate the user to a page where user can *Add Employee*.
* **Employee** page also have a Delete button associated to each Employee. This button can delete Employee.
## Bugs
* If an employee is added or deleted it is not reflecting in Employee table. Employee Delete API, and Employee Create API are not connected to Employee Details API(Employee table).
* Sometimes Delete API gives unformatted response due to which error comes. In this case the app will ask the user to delete again. On performing delete action again it will delete the Employee.
* Sometime Create API does'nt gives response. In this case user have to submit form again to add. 

# Steps to run the program.
* Clone the github repo [https://github.com/NextIshwar/Geeks.git](https://github.com/NextIshwar/Geeks.git)
* Go to *GeeksVila* directory.
* Run `Flutter pub get` to get all the dependencies.
* Run `Flutter run` or press `F5` to debug the app.
