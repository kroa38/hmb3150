#!/bin/sh

rm -f 3record.db
cp 3record_original.db 3record.db

FILE_LOCATION=$HOME/Desktop
FILE='3record.db'
retval=0
			
current_year=$(date -I | awk '{print substr($0,0,4)}')
current_month=$(date -I | awk '{print substr($0,6,2)}')		 
current_day=$(date -I | awk '{print substr($0,9,2)}')	 			   
current_hh=$(date | awk '{print substr($4,0,2)}')
current_mm=$(date | awk '{print substr($4,4,2)}')

fill_month(){
	
	case $1 in

		1)
		ret_val="janvier"
		;;
		2)
		ret_val="fevrier"
		;;	
		3)
		ret_val="mar"
		;;
		4)
		ret_val="avril"
		;;					
		5)
		ret_val="mai"
		;;
		6)
		ret_val="juin"
		;;	
		7)
		ret_val="juillet"
		;;
		8)
		ret_val="aout"
		;;	
		9)
		ret_val="septembre"
		;;	
		10)
		ret_val="octobre"
		;;	
		11)
		ret_val="novembre"
		;;	
		12)
		ret_val="decembre"
		;;							
		*)
		ret_val=$1
		;;
	esac

	echo $ret_val
}


fill_string(){

	
	
	case $1 in
		0)
		ret_val="00"
		;;	
		1)
		ret_val="01"
		;;
		2)
		ret_val="02"
		;;	
		3)
		ret_val="03"
		;;
		4)
		ret_val="04"
		;;					
		5)
		ret_val="05"
		;;
		6)
		ret_val="06"
		;;	
		7)
		ret_val="07"
		;;
		8)
		ret_val="08"
		;;	
		9)
		ret_val="09"
		;;	
		*)
		ret_val=$1
		;;
	esac

	echo $ret_val

}      

#bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
insert_date_year(){


	
		    record_number=$1
			retval=0
			
			data1=$(date -I | awk '{print substr($0,0,4)}')
			
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual date year is : $data1   Type in new date year or press enter :  " new_date 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge $data1 && test $new_date -lt 2040
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date_year=$new_date WHERE ID=$record_number")
			
}
  
insert_date_month(){

		    record_number=$1
			retval=0	
			data1=$(date -I | awk '{print substr($0,6,2)}')	
			
			while [ $retval -eq 0 ]
       		do	 
	     		 read -p "Actual date month is : $data1   Type in new date month or press enter :  " new_date 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 1 && test $new_date -lt 13
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date_month=$new_date WHERE ID=$record_number")
			
}      	 

insert_date_day(){

		    record_number=$1
			retval=0
			data1=$(date -I | awk '{print substr($0,9,2)}')	
								
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual date day is : $data1   Type in new date day or press enter :  " new_date 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 1 && test $new_date -lt 32
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date_day=$new_date WHERE ID=$record_number")
			
}   		
        	 
insert_start_hour(){

		    record_number=$1
			retval=0
			data1=$(date | awk '{print substr($4,0,2)}')
					
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual start hour is : $data1   Type in new start hour or press enter :  " new_date   		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 24
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET start_hour=$new_date WHERE ID=$record_number")
			
}   

insert_start_minute(){

		    record_number=$1
			retval=0
			data1=$(date | awk '{print substr($4,4,2)}')
					
			while [ $retval -eq 0 ]
       		do
     		read -p "Actual start minute is : $data1   Type in new start minute or press enter :  " new_date   		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 60
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET start_minute=$new_date WHERE ID=$record_number")
			
}  
insert_length_hour(){

		    record_number=$1
			retval=0
				
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual lengh Hour is 1 : Type in new length hour or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 24
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET length_hour=$new_date WHERE ID=$record_number")
			
}             	 
insert_length_minute(){

		    record_number=$1
			retval=0
				
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual lengh Minute is 0 : Type in new length minute or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 60
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=0
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET length_minute=$new_date WHERE ID=$record_number")
			
}   
        	 
insert_channel(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT channel FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual channel is 7 : Type in new channel or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 1000
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=7
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET channel=$new_date WHERE ID=$record_number")
			
}
			        	 
fill_unused_field(){

		    record_number=$1		
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET datestamp=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET source=10 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET quality=7 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET target=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET SAP=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET enable=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET lock=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET schedule_type=0 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET event_id=-1 WHERE ID=$record_number")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET user_id=0 WHERE ID=$record_number")
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET user_string=0 WHERE ID=$record_number")
}
#bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
replace_date_year(){

		    record_number=$1
			retval=0
					    
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_year FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual date year is : $data1   Type in new date year or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge $current_year && test $new_date -lt 2040
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date_year=$new_date WHERE ID=$record_number")
			
}
  
replace_date_month(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_month FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual date month is : $data1   Type in new date month or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 1 && test $new_date -lt 13
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date_month=$new_date WHERE ID=$record_number")
			
}      	 

replace_date_day(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_day FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual date day is : $data1   Type in new date day or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 1 && test $new_date -lt 32
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET date_day=$new_date WHERE ID=$record_number")
			
}   		
        	 
replace_start_hour(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_hour FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual start hour is : $data1   Type in new start hour or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 24
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET start_hour=$new_date WHERE ID=$record_number")
			
}   

replace_start_minute(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_minute FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual start minute is : $data1   Type in new start minute or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 60
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET start_minute=$new_date WHERE ID=$record_number")
			
}  
replace_length_hour(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_hour FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual length hour is : $data1   Type in new length hour or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 24
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET length_hour=$new_date WHERE ID=$record_number")
			
}             	 
replace_length_minute(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_minute FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual length minute is : $data1   Type in new length minute or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 60
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET length_minute=$new_date WHERE ID=$record_number")
			
}   
        	 
replace_channel(){

		    record_number=$1
			retval=0
			
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT channel FROM timer_record_table WHERE ID = $record_number")
		
			while [ $retval -eq 0 ]
       		do
     		 read -p "Actual channel is : $data1   Type in new channel or press enter :  " new_date    		 	 
	     		 
     		 if [ "$new_date" ]     	
     		 then	 
				if test $new_date -ge 0 && test $new_date -lt 1000
				then
				retval=1
			else
				retval=0
			fi
			else
				retval=1 
			fi
	     	done
	     
	     	if  test "$new_date" == "" 
	     	then
	     	new_date=$data1
	     	fi
			retval=0
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET channel=$new_date WHERE ID=$record_number")
			
}
			        
delete_record(){


     		 if [ "$1" ]    
     		 then
  				if test $1 -ge 0 && test $1 -lt 1000
				then
				data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "DELETE FROM timer_record_table WHERE ID = $1")
			fi
		fi
}
display_all_record(){

a=0
echo "ID   Date               Heure de debut    Duree         Chaine "

while read line  
do   
   record_number=$( echo -e "$line" )  
   display_record_line $record_number
done < record_id.txt

}

display_record_line () {

	record_number=$1


dataID=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT ID FROM timer_record_table WHERE ID = $record_number") 2>/dev/null
 
if [ "$dataID" ] 
then

data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_year FROM timer_record_table WHERE ID = $record_number")

data2=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_month FROM timer_record_table WHERE ID = $record_number")
data2=$(fill_month $data2)

data3=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_day FROM timer_record_table WHERE ID = $record_number")
data3=$(fill_string $data3)

data4=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_hour FROM timer_record_table WHERE ID = $record_number")
data4=$(fill_string $data4)

data5=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_minute FROM timer_record_table WHERE ID = $record_number")
data5=$(fill_string $data5)

data6=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_hour FROM timer_record_table WHERE ID = $record_number")
data6=$(fill_string $data6)

data7=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_minute FROM timer_record_table WHERE ID = $record_number")
data7=$(fill_string $data7)

data8=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT channel FROM timer_record_table WHERE ID = $record_number")
data8=$(fill_string $data8)

newdatestring=$( echo "$data3-$data2-$data1                            " -I |  awk '{print substr($datestring,0,18)}' )
newID=$( echo "$dataID      " -I |  awk '{print substr($datestring,0,4)}' )


echo "$newID $newdatestring $data4 h $data5           $data6 h $data7       $data8"

else
echo "Bad record Number !"
fi

}
			        
display_record_raw () {

			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT ID FROM timer_record_table WHERE ID = $record_number")
			echo "ID  :$data1"
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT datestamp FROM timer_record_table WHERE ID = $record_number")
			#echo "datestamp  :$data1"

			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date FROM timer_record_table WHERE ID = $record_number")
			#echo "date  :$data1"				
		
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_year FROM timer_record_table WHERE ID = $record_number")
			echo "date_year  :$data1"
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_month FROM timer_record_table WHERE ID = $record_number")
			echo "date_month  :$data1"

			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_day FROM timer_record_table WHERE ID = $record_number")
			echo "date_day  :$data1"
			
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_hour FROM timer_record_table WHERE ID = $record_number")
			echo "start_hour  :$data1"	
						
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_minute FROM timer_record_table WHERE ID = $record_number")
			echo "start_minute  :$data1"		
					
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_hour FROM timer_record_table WHERE ID = $record_number")
			echo "length_hour  :$data1"	
					
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_minute FROM timer_record_table WHERE ID = $record_number")
			echo "length_minute  :$data1"				
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT source FROM timer_record_table WHERE ID = $record_number")
			#echo "source  :$data1"	
				
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT channel FROM timer_record_table WHERE ID = $record_number")
			echo "channel  :$data1"	
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT quality FROM timer_record_table WHERE ID = $record_number")
			#echo "quality  :$data1"		
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT target FROM timer_record_table WHERE ID = $record_number")
			#echo "target  :$data1"		
					
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT SAP FROM timer_record_table WHERE ID = $record_number")
			#echo "SAP  :$data1"	
						
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT timestamp_start FROM timer_record_table WHERE ID = $record_number")
			#echo "timestamp_start  :$data1"				

			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT timestamp_offset FROM timer_record_table WHERE ID = $record_number")
			#echo "timestamp_offset  :$data1"	
	
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT enable FROM timer_record_table WHERE ID = $record_number")
			echo "enable  :$data1"		
								
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT lock FROM timer_record_table WHERE ID = $record_number")
			echo "lock  :$data1"	
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT schedule_type FROM timer_record_table WHERE ID = $record_number")
			#echo "schedule_type :$data1"	
															
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT event_id FROM timer_record_table WHERE ID = $record_number")
			#echo "event_id  :$data1"	
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT user_id FROM timer_record_table WHERE ID = $record_number")
			#echo "user_id  :$data1"				
			
			#data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT user_string FROM timer_record_table WHERE ID = $record_number")
			#echo "user_string  :$data1"				
}   
			
compute_timestamp(){

		    record_number=$1
		    data_year=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_year FROM timer_record_table WHERE ID = $record_number")
		    data_month=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_month FROM timer_record_table WHERE ID = $record_number")
   			data_month=$(fill_string $data_month)
		    data_day=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT date_day FROM timer_record_table WHERE ID = $record_number")
   			data_day=$(fill_string $data_day)
		    data_hh=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_hour FROM timer_record_table WHERE ID = $record_number")
   			data_hh=$(fill_string $data_hh)
		    data_mm=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT start_minute FROM timer_record_table WHERE ID = $record_number")
   			data_mm=$(fill_string $data_mm)
			database_timestamp=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT strftime('%s','$data_year-$data_month-$data_day $data_hh:$data_mm:00','UTC')")
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET timestamp_start=$database_timestamp WHERE ID=$record_number")
			 echo $database_timestamp    #valeur de retour de la fonction
			}
			
compute_timestamp_offset(){


		    record_number=$1
		    data_length_hour=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_hour FROM timer_record_table WHERE ID = $record_number")
   			data_length_hour=$(fill_string $data_length_hour)
		    data_length_minute=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT length_minute FROM timer_record_table WHERE ID = $record_number")
   			data_length_minute=$(fill_string $data_length_minute)
			offset_calculated=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT strftime('%s','1970-01-01 $data_length_hour:$data_length_minute:00','+1 hours','UTC')")	
			data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "UPDATE timer_record_table SET timestamp_offset=$offset_calculated WHERE ID=$record_number")
			   			 
			echo $offset_calculated    #valeur de retour de la fonction
		 
		}

	 														
while :

do
	clear
        # display menu
	echo "Server Name - $(hostname)"
	echo "-------------------------------"
	echo "     M A I N - M E N U"
	echo "-------------------------------"
	echo "1. Display date and time"
	echo "2. Display timestamp"
	echo "4. Display all record"
	echo "5. Dump"    
	echo "6. Display Last ID and the number of record"  
	echo "7. Display ID list Number"  
	echo "8. Display Current Date" 
	echo "9. Display record number"     
	echo "10. Display record number detailed"
	echo "11. Modifie record"
	echo "12. Delete record"
	echo "13. Create record"
	echo "14. Display all record"
	echo "55. Exit"


        # get input from the user 
	read -p "Enter your choice [ 1 -20 ] " choice
        # make decision using case..in..esac 
	case $choice in
		1)
			echo "Today is $(date)"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		2) 
			sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT strftime('%s','now','UTC')"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		4)
			sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT * FROM timer_record_table"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		5)
			sqlite3 "${FILE_LOCATION}/${FILE}" ".dump"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;			
		6)
			sqlite3 "${FILE_LOCATION}/${FILE}" "select ID,count(ID) from timer_record_table"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		7)
			sqlite3 "${FILE_LOCATION}/${FILE}" "select ID from timer_record_table" >record_id.txt
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		8)
			sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT datetime('now')"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		9)
		    read -p "Enter record number  : " record_number
			sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT * FROM timer_record_table WHERE ID = $record_number"
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
		10)
		
		    read -p "Enter record number  : " record_number
			echo "ID   Date               Heure de debut    Duree         Chaine "
		    display_record_line $record_number	
		    																				
			read -p "Press [Enter] key to continue..." readEnterKey
			;;			

		11)
		     		
		sqlite3 "${FILE_LOCATION}/${FILE}" "select ID from timer_record_table" >record_id.txt
		display_all_record
		
		 retval=0
		 
		
			while [ $retval -eq 0 ]
       		do
		    read -p "Enter record number  :" record_number		
		     
		     if [ "$record_number" ] 
		     then
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT ID FROM timer_record_table WHERE ID=$record_number")

		     if [ "$data1" ] 
		     then
		     
			replace_date_year $record_number
			replace_date_month $record_number
			replace_date_day $record_number	
			replace_start_hour $record_number	
			replace_start_minute $record_number	
			replace_length_hour $record_number			
			replace_length_minute $record_number
			replace_channel $record_number	
			set -xv
			database_timestamp=$(compute_timestamp $record_number)
			current_timestamp=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT strftime('%s','now')")
		    offset_calculated=$(compute_timestamp_offset $record_number)
		    echo " offset  = $offset_calculated"
		    set +xv
		    
     		 if test $database_timestamp -gt $current_timestamp
			then
				retval=1
				read -p " Date OK! : Press [Enter] key to continue..." readEnterKey		
			else
				retval=0
				read -p "Date not possible !" readEnterKey	
			fi
			
			if test $retval -eq 1
			then
			
     		 if test $offset_calculated -gt 0
			then
				retval=1
				read -p " Length OK! : Press [Enter] key to continue..." readEnterKey		
			else
				retval=0
				read -p "Length null not possible !" readEnterKey	
			fi		
			fi
			else
				retval=1
			fi
			else
				retval=1
			fi	
	     	done
			
     		;;   						
			
     	12)
		sqlite3 "${FILE_LOCATION}/${FILE}" "select ID from timer_record_table" >record_id.txt
		display_all_record
		
     		read -p "Enter record number  : " record_number
     		data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT ID FROM timer_record_table WHERE ID=$record_number")
     		if [ "$data1" ] 
		     then
     		delete_record $record_number
     		read -p "Record Deleted !         Press [Enter] key to continue..." readEnterKey
     		fi
     		;;
     		
     	13)
     		record_number=1
     		retval=0
 
     		while [ $retval -eq 0 ]
       		do
       				data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "INSERT INTO timer_record_table (ID) values($record_number)" 2>errorfile.txt)
       				if [ -s errorfile.txt ] 
       			     then	
					retval=0 
					record_number=$record_number+1
       			    else
					retval=1  
       			    fi 	 		
       		done
 
 		 	retval=0
		 
			while [ $retval -eq 0 ]
       		do
		     
		     if [ "$record_number" ] 
		     then
		    data1=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT ID FROM timer_record_table WHERE ID=$record_number")

		     if [ "$data1" ] 
		     then	       		
 			insert_date_year $record_number
			insert_date_month $record_number
			insert_date_day $record_number	
			insert_start_hour $record_number	
			insert_start_minute $record_number	
			insert_length_hour $record_number			
			insert_length_minute $record_number
			insert_channel $record_number	     
			fill_unused_field $record_number	 		
 			database_timestamp=$(compute_timestamp $record_number)
			current_timestamp=$(sqlite3 "${FILE_LOCATION}/${FILE}" "SELECT strftime('%s','now')")
		    offset_calculated=$(compute_timestamp_offset $record_number)
		    #echo " offset  = $offset_calculated"
		    
     		 if test $database_timestamp -gt $current_timestamp
			then
				retval=1
				#read -p " Date OK! : Press [Enter] key to continue..." readEnterKey		
			else
				retval=0
				read -p "Date not possible !" readEnterKey	
			fi
			
			if test $retval -eq 1
			then
			
     		 if test $offset_calculated -gt 0
			then
				retval=1
				#read -p " Length OK! : Press [Enter] key to continue..." readEnterKey		
			else
				retval=0
				read -p "Length null not possible !" readEnterKey	
			fi		
			fi
			else
				retval=1
			fi
			else
				retval=1
			fi	
	     	done
       		
       		echo "Record  number ID = $((record_number)) created " 
       		 display_record_line $record_number

     	read -p "Press [Enter] key to continue..." readEnterKey
     	rm errorfile.txt
     	;;	
	
		14)
		
		sqlite3 "${FILE_LOCATION}/${FILE}" "select ID from timer_record_table" >record_id.txt
		display_all_record
		read -p "Press [Enter] key to continue..." readEnterKey
		
		;;
		
     	
		55)
			echo "Bye!"
			exit 0
			;;
		*)
			echo "Error: Invalid option..."	
			read -p "Press [Enter] key to continue..." readEnterKey
			;;
	esac		
 
done





