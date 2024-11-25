#!/bin/bash

# Infinite loop to continuously update the table
while true; do
  # Clear the screen before displaying new information
  clear

  # Display current date and time as the last refresh timestamp with a fancy border
  echo -e "\033[1;36m╔══════════════════════════════════════════════════════════════════════╗"
  echo -e "║                     Last Updated: $(date '+%Y-%m-%d %H:%M:%S')                ║"
  echo -e "╚══════════════════════════════════════════════════════════════════════╝\033[0m"
  echo

  # Fancy table header with clear column titles and distinct borders
  echo -e "\033[1;32m╔═════════════════════╦═════════════════════╗"
  echo -e "║        Date         ║        Time         ║"
  echo -e "╠═════════════════════╬═════════════════════╣\033[0m"

  # Display the most recent 10 timestamps with alternating row colors
  tac time_log.log | head -n 10 | awk -v line_count=0 '{
    split($0, dt, "T| ");
    line_count++;
    if (line_count == 1) {
      # Highlight the most recent timestamp in bold yellow
      printf "\033[1;33;1m║ %-19s ║ %-19s ║\033[0m\n", dt[1], dt[2]
    } else if (line_count % 2 == 0) {
      # Alternate row color (cyan for even rows)
      printf "\033[1;36m║ %-19s ║ %-19s ║\033[0m\n", dt[1], dt[2]
    } else {
      # Default row color (light gray for odd rows)
      printf "\033[1;37m║ %-19s ║ %-19s ║\033[0m\n", dt[1], dt[2]
    }
    # Print divider after each row except the last one
    if (line_count < 10) {
      print "\033[1;32m╠═════════════════════╬═════════════════════╣\033[0m"
    }
  }'

  # Fancy footer to close the table
  echo -e "\033[1;32m╚═════════════════════╩═════════════════════╝\033[0m"

  # Add a summary footer with total count and a separator
  total_lines=$(wc -l < time_log.log)
  echo -e "\033[1;35m╔══════════════════════════════════════════════════════════════════════╗"
  echo -e "║               Total Timestamps Recorded: $total_lines                        ║"
  echo -e "╚══════════════════════════════════════════════════════════════════════╝\033[0m"

  # Sleep for 2 seconds before refreshing
  sleep 2
done
