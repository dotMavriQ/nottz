
#! /bin/sh

FILE="$1"

[ -z "$FILE" ] && {
    echo "Was ya file mate?"
        echo "$0 FILE"
            exit 1
            }

            [ ! -e "$FILE" ] && {
                echo "It ain't existing now ain't it init?"
                    exit 1
                    } 

                    NEW_TOML=$({
                     sed -n '/+++/,/+++/p' "$FILE" \
                         | sed 's/+++//' \
                             | yj -tj \
                                 | jq ' .images = ( .images | map({ src: ., alt: "", stretch: "" }) )
                                       	 | .removeBlur = false
                                                     | .comments = false
                                                     	 | del(.type)' \
                                                              | yj -jt
                                                              })

                                                              SANS_TOML="$(sed -e '1,/+++/d' "$FILE")"

                                                              echo "+++
                                                              $NEW_TOML
                                                              +++
                                                              $SANS_TOML"
                                                              



