#!/bin/bash

# Here i need to store the Questions first 
N=5
ques=("Who discovered the Bash Language ?" "Which command is used to copy the content of one file into another file ?"
      "What is the working of fork system call ?" "What is the complexity of the binary search ?" "Predicting House prices , can be solved using which machine learning algorithm ? ")

options=("Brian Fox|Dipanshu Garg|BILL GATES|Issac Newton"
         "copy|cat|netcat|cp"
         "To create the chile process exact copy of parent|to print content of file|to kill the process|None of the above"
         "O(nlogn)|O(n)|O(n^2)|O(logn)"
         "K-Means clustering|Linear Regression|Logistic Regression|None of the above" 
        )
right=("1" "4" "1" "4" "2")

# User se input lena pdega ki start krna hai ya nahi 
user=$(dialog --title "Input" --inputbox "Enter your name:" 10 40 2>&1 >/dev/tty)

if [ "$user" != "" ]; then
    dialog --title "Quiz" --yesno "Hi $user\n\nLet's Start The Quiz ????" 10 50
    start=$?  
    if [ $start -eq 0 ]; then 
        score=0
        for i in "${!ques[@]}"; do
            # echo "${ques[$i]}"
            IFS='|' read -r -a opt <<< "${options[$i]}"
            opchoose=$(dialog --title "Question" --menu "${ques[$i]}" 25 80 4 \
            1 "${opt[0]}" \
            2 "${opt[1]}" \
            3 "${opt[2]}" \
            4 "${opt[3]}" 2>&1 >/dev/tty)
            
            if [ "$opchoose" = "${right[$i]}" ]; then
                score=$((score + 10))
            fi
        done 

        # ynha pe last me score print krana hoga simple :)
        dialog --msgbox "Great $user\nYOU PLAYED REALLY WELL :) \n\n Your score is : $score out of 50" 20 50  
    fi
fi
clear

