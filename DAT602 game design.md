# DAT602 game design

The game application (Foodie) follows the survival game with users who can compete for food and level up to increase the chance to survive and win other players.

## User 

### Register

Users will need to create an account to save their information for high scores and display names. The casual player will also be allowed to join without having a password but they will receive notification everytime they log in.

### Login

Users can access their saved data with the correct username and password is provided or if the account dont have 

### Edit

Users can choose to edit their current name or other information such as password, email(as long as it is not taken)

![image-20220316114408536](.\src\image-20220316114408536.png)

## Admin

### Access

Admin also log in as normal users, when the system checks if the user has `isAdmin: true` would be presented with a dashboard of the list of games, players as well other function to edit the system such as delete game, delete or edit users.

## Game

### Game logic

The game will be designed in a grid of 10x10 which is filled with obstacles and food to earn points and power up to improve the game experience. There will be 5 sets of maps with obstacles while the food and powerup will randomly spawn throughout the map. The points will calculate based on time taken to complete the level and food point user collected. The level can only be finished if the timer for the level like 2 minutes over or there are no more food on the board 

If user log out, the timer will stop while keeping the current stage status for the player, within 10s count down, if user didnt get back, they will lose the game and recieve the current points, the same goes with the winner.

Player can move only 1 block using arrow keys and receive food on the block but not passing though the obstables. The current power up would allow this increase the number of block they can move at one time, other power up is not available at this stage. Player can move on top of food, powerup, another user but not obstacles( may allow if future power up) 

![image-20220316114201154](.\src\image-20220316114201154.png)

![image-20220316114335633](.\src\image-20220316114335633.png)

The typeID will determine the type of block while locationID will hold the location of the tile on the map through value of column and row.

an example of a board might look like.

| food     |          |          | obstacle |          | food     |          | food     | obstacle |      |
| -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | ---- |
|          | obstacle |          |          | obstacle |          |          |          |          |      |
|          |          | food     |          |          |          | food     |          |          |      |
| obstacle |          |          |          |          | food     |          | food     |          |      |
|          |          |          | food     | power up |          |          | obstacle |          |      |
|          | obstacle |          |          |          |          |          |          | food     |      |
|          |          |          |          | food     |          | obstacle |          |          |      |
|          |          |          | obstacle |          |          |          |          |          |      |
|          | obstacle | obstacle | food     |          | obstacle |          | food     |          |      |
| User     |          |          | obstacle |          |          |          |          |          |      |

### Session

Creating a session for a game that takes in the ID of both players as well as the deadline of the game will contribute to scoring calculation as well as automatically delete the game if no one finished it

![image-20220316112528352](.\src\image-20220316112528352.png)

### Character details

Players will have their character details updated after each move such as `locationID` if you move to a normal tile, `power_up` if they move to tile with power up property and so on. The character is link to user with `userID`, the data will be reset after the game finished or deleted if user is deleted

![image-20220316112141261](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220316112141261.png)


## Chat

 The chat will display the latest 40 messages which display the userName, time and message content. The Chat will function as a global chat room which player can communicate with everyone.

![image-20220316115345867](.\src\image-20220316115345867.png)

## Wireframe

### Login

![image-20220222103312500](.\src\image-20220222103312500.png)

### Register

![image-20220222103438982](.\src\image-20220222103438982.png)

### Main Menu

![image-20220222104939946](.\src\image-20220222104939946.png)

### User details

![image-20220222114017261](.\src\image-20220222114017261.png)

The toggle to allow user to become Admin only available if the current user is Admin. When admin want to change users details, the same interface will present

### Admin.

![image-20220222113116586](.\src\image-20220222113116586.png)

### Game

![image-20220222115459417](.\src\image-20220222115459417.png)

Win the game

![image-20220222115738541](.\src\image-20220222115738541.png)

## Logical entity relationship diagram

Based on the game design, with user

![image-20220314142111399](.\src\image-20220314142111399.png)	

The CRUD table is included at the root level of the Github repo.



