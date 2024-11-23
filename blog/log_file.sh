# #!/bin/bash

# while true; do
#   clear
#   # Display current date and time as the last refresh timestamp
#   echo -e "\033[1;36mLast Updated: $(date '+%Y-%m-%d %H:%M:%S')\033[0m"
#   echo

#   # Fancy table header with colors
#   echo -e "\033[1;32m┌──────────────────────────────┐"
#   echo -e "│         \033[1;33mTimestamps\033[1;32m           │"
#   echo -e "├──────────────────────────────┤\033[0m"

#   # Display the most recent 10 timestamps, alternating row colors and adding horizontal dividers
#   tac time_log.txt | head -n 10 | awk '{
#     if (NR % 2 == 1) {
#       printf "\033[1;37m│ %-26s │\033[0m\n", $0  # Light gray for odd rows
#     } else {
#       printf "\033[1;30m│ %-26s │\033[0m\n", $0  # Dark gray for even rows
#     }
#     print "\033[1;32m├──────────────────────────────┤\033[0m"  # Divider after each row
#   }' | sed '$d'  # Remove the extra divider after the last row

#   # Fancy footer
#   echo -e "\033[1;32m└──────────────────────────────┘\033[0m"

#   # Add a summary footer with total count
#   total_lines=$(wc -l < time_log.txt)
#   echo -e "\033[1;35mTotal Timestamps Recorded: $total_lines\033[0m"

#   # Sleep and refresh
#   sleep 2
# done

#!/bin/bash

#!/bin/bash

#!/bin/bash

while true; do
  clear
  # Display current date and time as the last refresh timestamp
  echo -e "\033[1;36m╔════════════════════════════════════════════════╗"
  echo -e "║          Last Updated: $(date '+%Y-%m-%d %H:%M:%S')         ║"
  echo -e "╚════════════════════════════════════════════════╝\033[0m"
  echo

  # Fancy table header with column titles
  echo -e "\033[1;32m╔═════════════════╦════════════════╗"
  echo -e "║       Date       ║      Time      ║"
  echo -e "╠═════════════════╬════════════════╣\033[0m"

  # Parse and format the most recent 10 timestamps with alternating colors
  tac time_log.txt | head -n 5 | awk -v line_count=0 '{
    split($0, dt, "T| ");
    line_count++;
    if (line_count == 1) {
      # Highlight the most recent timestamp in yellow
      printf "\033[1;33m║ %-15s ║ %-14s ║\033[0m\n", dt[1], dt[2]
    } else if (line_count % 2 == 0) {
      # Alternate row color (dark gray for even rows)
      printf "\033[1;30m║ %-15s ║ %-14s ║\033[0m\n", dt[1], dt[2]
    } else {
      # Default row color (light gray for odd rows)
      printf "\033[1;37m║ %-15s ║ %-14s ║\033[0m\n", dt[1], dt[2]
    }
    print "\033[1;32m╠═════════════════╬════════════════╣\033[0m"
  }' | sed '$d'  # Remove the extra divider after the last row

  # Fancy footer
  echo -e "\033[1;32m╚═════════════════╩════════════════╝\033[0m"

  # Add a summary footer with total count and separator
  total_lines=$(wc -l < time_log.txt)
  echo -e "\033[1;35m╔════════════════════════════════════════════════╗"
  echo -e "║     Total Timestamps Recorded: $total_lines             ║"
  echo -e "╚════════════════════════════════════════════════╝\033[0m"

  # Sleep and refresh
  sleep 2
done
e


