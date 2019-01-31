BEGIN {
    printf("===== ALIASES =====\n");
}

# Line which begins with "alias"
/^alias/ {
    for (i=2; i<=NF; i++) {
        if ($i ~ /^#/ ){                # Remove comments
            break;
        } 
        else {
            sub("=", " ");              # Replace = by " "
            if (i == 2) {
                printf("%-20s", $i);    # Align right column
            }  else {
                printf $i" ";    
            }
                
        }
        
    }
    printf "\n"
    ++cnt;                              # Count each line beginning with alias
}


END {
    print "There is",cnt,"aliases"
}