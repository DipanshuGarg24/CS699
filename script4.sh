#!/bin/bash


# sudo apt install 
# imagemagick
# sudo find / -name "policy.xml"
# <policy domain="coder" rights="read|write" pattern="PDF" />
# suudo apt install libreoffice 

convert_images_to_pdf() {
    output_file="$1"
    shift 
    echo "Converting images to $output_file..."
    convert "$@" "$output_file"
    
    if [ $? -eq 0 ]; then
        echo "Conversion successful: $output_file"
    else
        echo "Failed to convert images to PDF."
    fi
}


convert_docx_to_pdf() {
    input_file="$1"
    output_file="${input_file%.docx}.pdf"
    
    echo "Converting $input_file to $output_file..."
    libreoffice --headless --convert-to pdf "$input_file" --outdir "$(dirname "$input_file")"
    
    if [ $? -eq 0 ]; then
        echo "Conversion successful: $output_file"
    else
        echo "Failed to convert $input_file to PDF."
    fi
}

# Check the number of arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <convert-type> <file-path> -- to convert from docx to pdf "
    echo "Usage: $0 <convert-type> <output.pdf> <image1.png> <image2.jpg> <image3.tiff>"
    echo "Convert type: 1. docx-pdf  2. pdf-docx  3.img-pdf"
    exit 1
fi

convert_type="$1"
file_path="$2"

# checking what is the input given by the user :)
echo "$@"
if [[ "$convert_type" == "docx-pdf" ]]; then
    if [ ! -f "$file_path" ]; then
    echo "File not found: $file_path"
    exit 1
    fi
    convert_docx_to_pdf "$file_path"

elif [[ "$convert_type" == "img-pdf" ]]; then
    shift
    convert_images_to_pdf "$@"
else 
    echo "No matching convert type found :("
fi



