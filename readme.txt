Script 1:
    Title:
        Quiz Game
    Motivation :
        It's a fun project in which i am using a GUI which is terminal based.

    Use Case :
        <script_name>
    Installation : 
        To run the script the dialog module should be installed 
        sudo apt-get install dialog

Script 2:
    Title :
        Wikipedia Scrapper

    Motivation : 
        When we use to read any book or learning something 
        then some technical word tease us.
        so this script will help you to search those technical terms 
        on Wikipedia and provide you with a brief summary
    
    Use Case : 
        <Script_name> <search term>

        Note : if search term contain multiple word then encode the search term 
                in single quote
    
    Installation : 
        To run the Script you need to install jq and curl 

        sudo apt-get install jq curl 
    

Script 3: 
    Title : 
        Local File Backup system
    
    Motivation : 
        In our day to day life we want to take backup of our folder into some other safe places , as sometime it may happen that we may delete the folder or the file by mistake 
        so having a backup at different location will help us a lot in retriving the files back
    
    Use case : 
        <script name> -i <input_folder path> -o <output folder path> 

    Installation : 
        No prior Installation required


Script 4 :

    Title : 
        Img-docx to pdf Convertor
    
    Motivation : 
        In our day to day life , we encounter a situation when we want to convert bunch of images into pdf or any docx file into the pdf 
        this script will allow you to do this task very easily
    
    UseCase :
        <script> <img-pdf> <output.pdf> <filepath>
        <script> <docx-pdf> <filepath>
        convert-type : 
            1. docx-pdf
            2. img-pdf
    
    Installation Required :
        1. sudo apt-get install imagemagick
        2. sudo apt-get install libreoffice
        3. This step is crucial 
            a. fetch the path of policy.xml 
                using the command  
            sudo find / -name "policy.xml"

            b. and comment out the given line     
            <policy domain="coder" rights="read|write" pattern="PDF" />



