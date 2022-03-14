# DAT602 game design

The game application (Foodie) follows the survival game with users who can compete for food and level up to increase the chance to survive and win other players.

## User 

### Register

![image-20220314140348352](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220314140348352.png

Users will need to create an account to save their information for high scores and display names. The casual player will also be allowed to join without registering but they will receive random generate names ie Player12345, no password, and also a timer before their account was removed.

### Login

Users can access their saved data if the correct username and password is provided

### Edit

Users can choose to edit their current name and details.

### User table

| default value    | Column           | Datatype    |
| ---------------- | ---------------- | ----------- |
| 5                | loginAttempt     | Number      |
| true             | isLogin          | Bool        |
| Player000000     | username         | VarChar(16) |
| Password0        | password         | VarChar(16) |
| email0@gmail.com | email            | VarChar(16) |
| false            | isAdmin          | Bool        |
| 0                | highestScore     | Number      |
| {}               | characterDetails | JSON        |

## Admin

### Access

Admin also log in as normal users, when the system checks if the user has `isAdmin: true` would be presented with a dashboard of the list of games, the player as well other function to edit the system

## Game

### Game logic

The game will be designed in a grid of 10x10 which is filled with obstacles and food to earn points and power up to improve the game experience. There will be 5 sets of maps with obstacles while the food and powerup will randomly spawn throughout the map. The points will calculate based on time taken to complete the level and food point user collected. The level can only be finished if the timer for the level like 2 minutes over or there are no more food on the board 

If user log out, the timer will stop while keeping the current stage status for the player, within 10s count down, if user didnt get back, they will lose the game and recieve the current points, the same goes with the winner.

Player can move only 1 block using arrow keys and receive food on the block they take but not passing though the obstables. The current power up would allow this increase the number of block they can move at one time, other power up is not available at this stage. Player can move on top of food, powerup, another user but not obstacles( may allow if future power up) 

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

Creating session for the player 

### Player details

Players will have their character details updated with each move. Character details will be reset after each game except `currentScore` and `currentScore` will be reset after 5 games.

| Column           | Datatype | default value |
| ---------------- | -------- | ------------- |
| currentLocationX | Number   | 0             |
| currentLocationY | Number   | 0             |
| currentTime      | DateTime | 00            |
| speed            | Number   | 0             |
| currentScore     | Number   | 0             |



## Chat

 The chat will display the latest 40 messages which display the userName, time and message content. Currently, the old messages will be deleted.

| Column    | Datatype     | value      |
| --------- | ------------ | ---------- |
| timeStamp | DateTime     | Date.now() |
| message   | Varchar(255) | "Hello"    |
| userName  | String       | player0000 |



## Wireframe

### Login

![image-20220222103312500](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222103312500.png)

### Register

![image-20220222103438982](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222103438982.png)

### Main Menu

![image-20220222104939946](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222104939946.png)

### User details

![image-20220222114017261](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222114017261.png)

The toggle to allow user to become Admin only available if the current user is Admin. When admin want to change users details, the same interface will present

### Admin.

![image-20220222113116586](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222113116586.png)

### Game

![image-20220222115459417](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222115459417.png)

Win the game

![image-20220222115738541](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220222115738541.png)





![image-20220314142111399](C:\Users\John-Dao\AppData\Roaming\Typora\typora-user-images\image-20220314142111399.png)