#!/bin/sh

trap 'do_menu' 2

. ./address_libraries.sh

show_menu()
{
  echo "-- Address Book --"
  echo "1. List / Search, 2. Add, 3. Edit, 4. Remove"
  echo -en "Enter choice: "
}

do_menu()
{
  i=-1

  while [ "$i" != "q" ]; do
    show_menu
    read i
    i=`echo $i | tr '[A-Z]' '[a-z]'`
    case "$i" in 
	"1")
	list_items
	;;
	"2")
	add_item
	;;
	"3")
	edit_item
	;;
	"4")
	remove_item
	;;
	"q")
	echo "Bye"
	exit 0
	;;
	*)
	echo "Unrecognised input."
	;;
    esac
  done
}


if [ ! -f $BOOK ]; then
  echo "Creating $BOOK ..."
  touch $BOOK
fi

if [ ! -r $BOOK ]; then
  echo "Error: $BOOK not readable"
  exit 1
fi

if [ ! -w $BOOK ]; then
  echo "Error: $BOOK not writeable"
  exit 2
fi

do_menu

