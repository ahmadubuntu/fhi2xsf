#!/bin/bash

if test -d ~/.xcrysden
then
	echo ""
else
	mkdir ~/.xcrysden
fi


cat >> ~/.xcrysden/custom-definitions <<EOF
#------------------added by fhi2xsf
addOption --fhiaims ${PWD}/shfhi2xsf.sh {
  load structure from fhiaims geometry.in format
}					
EOF

cat > shfhi2xsf.sh << EOF
#! /bin/bash
${PWD}/fhi2xsf $1
EOF

chmod +x shfhi2xsf.sh
chmod +x fhi2xsf

echo "Now you can visualize geometry.in via xcrysden using the following command:"
echo "xcrysden --fhiaims geometry.in"
