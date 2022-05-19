echo ---Starting---

# Runs install
npm install

echo ---Install complete---

# Runs build
npm run build

RESULT=$?

if [[ $RESULT != 0 ]]; then
	echo "Build failed"
	exit 1
		
else
	echo "Build successful"
	echo "Would you like to commit build? [y/n]"
	
	read INPUT
	
	if [[ $INPUT == "y" ]]; then		
		git add .
		echo "Please specify commit message"
		read MESSAGE
		git commit -m "$MESSAGE"
		
		echo "Build commited"
		echo "Would you like to push? [y/n]"
		
		read INPUT2
		
		if [[ $INPUT2 == "y" ]]; then
			git push
		fi
				
	else
		exit 1
	fi
	
npm run start

fi

