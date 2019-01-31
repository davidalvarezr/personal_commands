BEGIN {
    printf("===== ALIASES =====\n");
}

# Line which begins with "alias"
/^alias/ {
    for (i=2; i<=NF; i++) {
        if ($i ~ /^#/ ){
            break;
        } 
        else {

            sub("=", " ");
            if (i == 2) {
                printf("%-20s", $i);
            }  else {
                printf $i" ";    
            }
                
        }
        
    }
    printf "\n"
    ++cnt;
}


END {
    print "There is",cnt,"aliases"
}