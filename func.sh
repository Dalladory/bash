#! /bin/bash/


function ShowAllGroups1() {
	less /etc/group
}


function ShowGroupName2() {
	echo -e "\n======================="
	echo -e "\nInput group name: "
	read name
	echo -e "\n----------------\n"
	less /etc/group | grep $name
	echo -e "\n----------------"
	echo -e "\n======================="
}

function ShowAllUsers3() {
        less /etc/passwd
}
function ShowUserName4() {
        echo -e "\n======================="
        echo -e "\nInput user  name: "
        read name
        echo -e "\n----------------\n"
        less /etc/passwd | grep $name
        echo -e "\n----------------"
        echo -e "\n======================="
}


function CreateGroup5() {
        echo -e "\n======================="
        echo -e "\nInput group  name: "
        read name
        echo -e "\nAdd your GUID(y - yes; n - no) ?"
	read check
	if [[ $check == "y" ]]
	then
		echo -e "\nInput GUID: "
		read guid
		sudo groupadd $name -g $guid
	elif [[ $check == "n" ]]
	then
		sudo groupadd $name
	else
	       echo -e "\nWrong choise"	
	fi
        echo -e "\n======================="
}

function EditGroup6() {
        echo -e "\n======================="
        echo -e "\nEdit by:\n\t 1. Name\n\t 2. Name + GUID:"
	read check
	echo -e "\nInput group name to edit"
	read name
	echo -e "\nInput new group name: "
	read newname
        if [[ $check == 1 ]]
        then
		sudo groupmod -n $newname $name
        elif [[ $check == 2 ]]
        then
                echo -e "\nInput GUID: "
		read guid
		sudo groupmod $name -g $guid
        else
               echo -e "\nWrong choise"
        fi
        echo -e "\n======================="
}

function DeleteGroup7() {
	echo -e "\n======================="
	echo -e "\nInput group name to delete: "
	read name
	sudo groupdel $name
	echo -e "\n======================="
}


function CreateUser8() {
        echo -e "\n======================="
	echo -e "\nCreate by:\n\t 1. Name\n\t 2. Name + UID\n\t 3. Name + UID + GUID:"
	read check
        echo -e "\nInput name: "
        read name
	if [[ $check == 2 || $check == 3 ]]
	then
		echo -e "\nInput UID:"
		read uid
	fi
	if [[ $check == 1 ]]
	then
		sudo useradd $name -m
	elif [[ $check == 2 ]]
	then
		sudo useradd $name -u $uid -m
	elif [[ $check == 3 ]]
	then
		echo -e "\nInput GUID:"
		read guid
		sudo useradd $name -u $uid -g $guid -m
	else
		echo -e "\nWrong choise"
	fi
	echo -e "\nAdd password? (y - yes; n - no)"
	read check
	if [[ $check == "y" ]]
	then
		sudo passwd $name
	elif [[ $check != "n" ]]
	then
		echo -e "\nWrong choise"
	fi
        echo -e "\n======================="
}

function EditUser9() {
	echo -e "\n======================="
	echo -e "\nEdit by:\n\t 1. Name\n\t 2. UID\n\t 3. GUID:"
	read check
	echo -e "\nInput user name to edit:"
	read name
	if [[ $check == 1 ]]
	then
		echo -e "\nInput new name:"
		read newname
		sudo usermod -l $newname $name 
	elif [[ $check == 2 ]]
	then
		echo -e "\nInput new UID:"
		read uid
		sudo usermod $name -u $uid
	elif [[ $check == 3 ]]
	then
		echo -e "\nInput new GUID:"
		read guid
		sudo usermod $name -g $guid
	else
		echo -e "\nWrong choise"
	fi
	echo -e "\n======================="
}


function DeleteUser10() {
	echo -e "\n======================="
	echo -e "\nInput user name to delete:"
	read name
	sudo userdel $name -r
	echo -e "\n======================="
}

