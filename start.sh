#! /bin/bash/

clear

source func.sh

function Menu() {
	
	echo -e "\n0. Exit\n 1. Show all groups\n 2. Show group by name\n 3. Show all users\n 4. Show user by name\n 5. Create new group\n 6. Edit group\n 7. Delete group\n 8. Create user\n 9. Edit user\n 10. Delete user:"
 read choise
 case "$choise" in
	0) exit=1; echo -e "\nBye!"; ;;
	1) ShowAllGroups1; ;;
	2) ShowGroupName2; ;;
	3) ShowAllUsers3; ;;
	4) ShowUserName4; ;;
	5) CreateGroup5; ;;
	6) EditGroup6; ;;
	7) DeleteGroup7; ;;
	8) CreateUser8; ;;
	9) EditUser9; ;;
	10) DeleteUser10; ;;
        *) echo -e "\nWrong choise\n"; ;;	
 esac

}

let exit=0

while [[ $exit == 0 ]]
do
	Menu;
done


