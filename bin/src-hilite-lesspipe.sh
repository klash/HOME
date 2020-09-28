#! /bin/sh

HIGHLIGHT_STYLE_FILE=${HIGHLIGHT_STYLE_FILE:-$HOME/.klash.style}

for source in "$@"; do
    case $source in
	*ChangeLog|*changelog) 
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=$HIGHLIGHT_STYLE_FILE -i "$source" ;;
	*Makefile|*makefile) 
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=$HIGHLIGHT_STYLE_FILE -i "$source" ;;
	*.sc)
        source-highlight --failsafe -f esc --lang-def=python.lang --style-file=$HIGHLIGHT_STYLE_FILE -i "$source" ;;
        *) source-highlight --failsafe --infer-lang -f esc --style-file=$HIGHLIGHT_STYLE_FILE -i "$source" ;;
    esac
done
