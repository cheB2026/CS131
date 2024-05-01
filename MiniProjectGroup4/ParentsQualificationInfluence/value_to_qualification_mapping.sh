#!/bin/bash

declare -A mapping

mapping[1]="Secondary Education - 12th Year of Schooling"
mapping[2]="Higher Education - Bachelor's Degree"
mapping[3]="Higher Education - Degree"
mapping[4]="Higher Education - Master's"
mapping[5]="Higher Education - Doctorate"
mapping[6]="Frequency of Higher Education"
mapping[9]="12th Year of Schooling - Not Completed"
mapping[10]="11th Year of Schooling - Not Completed"
mapping[11]="7th Year (Old)"
mapping[12]="Other"
mapping[13]="2nd year complementary high school course"
mapping[14]="10th Year of Schooling"
mapping[15]="10th year of schooling - not completed"
mapping[18]="General commerce"
mapping[19]="Basic Education 3rd Cycle (9th/10th/11th Year)"
mapping[20]="Complementary High School"
mapping[22]="Technical-professional course"
mapping[25]="Complementary High School Course - not concluded"
mapping[26]="7th year of schooling"
mapping[27]="2nd cycle of the general high school"
mapping[29]="9th Year of Schooling - Not Completed"
mapping[30]="8th year of schooling"
mapping[31]="General Course of Administration and Commerce"
mapping[33]="Supplementary Accounting and Administration"
mapping[34]="Unknown"
mapping[35]="Can't read or write"
mapping[36]="Can read without having a 4th year of schooling"
mapping[37]="Basic education 1st cycle (4th/5th year)"
mapping[38]="Basic Education 2nd Cycle (6th/7th/8th Year)"
mapping[39]="Technological specialization course"
mapping[40]="Higher education - degree (1st cycle)"
mapping[41]="Specialized higher studies course"
mapping[42]="Professional higher technical course"
mapping[43]="Higher Education - Master (2nd cycle)"
mapping[44]="Higher Education - Doctorate (3rd cycle)"

get_mapped_value() {
  echo "${mapping[$1]}"
}

