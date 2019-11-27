#!/bin/sh
#
# Usage:
#
#    sh install.sh
#
# Environment variables: VERBOSE, CP, LN, MKDIR, RM, DIRNAME.
#
#    env VERBOSE=1 sh install.sh
#
# DO NOT EDIT THIS FILE
# 
# This file is generated by rcm(7) as:
#
#   rcup -B 0 -g
#
# To update it, re-run the above command.
#
: ${VERBOSE:=0}
: ${CP:=/bin/cp}
: ${LN:=/bin/ln}
: ${MKDIR:=/bin/mkdir}
: ${RM:=/bin/rm}
: ${DIRNAME:=/usr/bin/dirname}
verbose() {
  if [ "$VERBOSE" -gt 0 ]; then
    echo "$@"
  fi
}
handle_file_cp() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        $RM -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi
  verbose "'$1' -> '$2'"
  $MKDIR -p "$($DIRNAME "$2")"
  $CP -R "$1" "$2"
}
handle_file_ln() {
  if [ -e "$2" ]; then
    printf "%s " "overwrite $2? [yN]"
    read overwrite
    case "$overwrite" in
      y)
        $RM -rf "$2"
        ;;
      *)
        echo "skipping $2"
        return
        ;;
    esac
  fi
  verbose "'$1' -> '$2'"
  $MKDIR -p "$($DIRNAME "$2")"
  $LN -sf "$1" "$2"
}
handle_file_ln "$HOME/.dotfiles/bash_profile" "$HOME/.bash_profile"
handle_file_ln "$HOME/.dotfiles/bashrc" "$HOME/.bashrc"
handle_file_ln "$HOME/.dotfiles/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/battery" "$HOME/.config/i3blocks/battery"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/bluetooth" "$HOME/.config/i3blocks/bluetooth"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/brightness" "$HOME/.config/i3blocks/brightness"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/calendar" "$HOME/.config/i3blocks/calendar"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/config" "$HOME/.config/i3blocks/config"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/mediaplayer" "$HOME/.config/i3blocks/mediaplayer"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/mediaplayer2" "$HOME/.config/i3blocks/mediaplayer2"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/process_input" "$HOME/.config/i3blocks/process_input"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/volume" "$HOME/.config/i3blocks/volume"
handle_file_ln "$HOME/.dotfiles/config/i3blocks/wifi" "$HOME/.config/i3blocks/wifi"
handle_file_ln "$HOME/.dotfiles/config/mpv/input.conf" "$HOME/.config/mpv/input.conf"
handle_file_ln "$HOME/.dotfiles/config/mpv/mpv.conf" "$HOME/.config/mpv/mpv.conf"
handle_file_ln "$HOME/.dotfiles/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/completion.vim" "$HOME/.config/nvim/lib/completion.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/editing.vim" "$HOME/.config/nvim/lib/editing.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/files.vim" "$HOME/.config/nvim/lib/files.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/git.vim" "$HOME/.config/nvim/lib/git.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/interface.vim" "$HOME/.config/nvim/lib/interface.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/cpp.vim" "$HOME/.config/nvim/lib/languages/cpp.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/json.vim" "$HOME/.config/nvim/lib/languages/json.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/python.vim" "$HOME/.config/nvim/lib/languages/python.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/tex.vim" "$HOME/.config/nvim/lib/languages/tex.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/languages/yaml.vim" "$HOME/.config/nvim/lib/languages/yaml.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/lib/plugins.vim" "$HOME/.config/nvim/lib/plugins.vim"
handle_file_ln "$HOME/.dotfiles/config/nvim/spell/de.utf-8.add" "$HOME/.config/nvim/spell/de.utf-8.add"
handle_file_ln "$HOME/.dotfiles/config/nvim/spell/en.utf-8.add" "$HOME/.config/nvim/spell/en.utf-8.add"
handle_file_ln "$HOME/.dotfiles/config/sway/config" "$HOME/.config/sway/config"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/colors" "$HOME/.config/sway/config.d/colors"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/exit-menu" "$HOME/.config/sway/config.d/exit-menu"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/idle-manager" "$HOME/.config/sway/config.d/idle-manager"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/keybindings" "$HOME/.config/sway/config.d/keybindings"
handle_file_ln "$HOME/.dotfiles/config/sway/config.d/notification-daemon" "$HOME/.config/sway/config.d/notification-daemon"
handle_file_ln "$HOME/.dotfiles/config/sway/env" "$HOME/.config/sway/env"
handle_file_ln "$HOME/.dotfiles/config/waybar/config" "$HOME/.config/waybar/config"
handle_file_ln "$HOME/.dotfiles/config/waybar/spotify.sh" "$HOME/.config/waybar/spotify.sh"
handle_file_ln "$HOME/.dotfiles/config/waybar/style.css" "$HOME/.config/waybar/style.css"
handle_file_ln "$HOME/.dotfiles/config/zathura/zathurarc" "$HOME/.config/zathura/zathurarc"
handle_file_ln "$HOME/.dotfiles/fzf-plugins/history-exec.bash" "$HOME/.fzf-plugins/history-exec.bash"
handle_file_ln "$HOME/.dotfiles/gitconfig" "$HOME/.gitconfig"
handle_file_ln "$HOME/.dotfiles/inputrc" "$HOME/.inputrc"
handle_file_ln "$HOME/.dotfiles/install.sh" "$HOME/.install.sh"
handle_file_ln "$HOME/.dotfiles/latexmkrc" "$HOME/.latexmkrc"
handle_file_ln "$HOME/.dotfiles/LICENSE" "$HOME/.LICENSE"
handle_file_ln "$HOME/.dotfiles/local/bin/bing-wallpaper" "$HOME/.local/bin/bing-wallpaper"
handle_file_ln "$HOME/.dotfiles/local/bin/ciprun" "$HOME/.local/bin/ciprun"
handle_file_ln "$HOME/.dotfiles/local/bin/cmdlist" "$HOME/.local/bin/cmdlist"
handle_file_ln "$HOME/.dotfiles/local/bin/extract" "$HOME/.local/bin/extract"
handle_file_ln "$HOME/.dotfiles/local/bin/fzf-open" "$HOME/.local/bin/fzf-open"
handle_file_ln "$HOME/.dotfiles/local/bin/is-mosh" "$HOME/.local/bin/is-mosh"
handle_file_ln "$HOME/.dotfiles/local/bin/launcher" "$HOME/.local/bin/launcher"
handle_file_ln "$HOME/.dotfiles/local/bin/on-lid-close" "$HOME/.local/bin/on-lid-close"
handle_file_ln "$HOME/.dotfiles/local/bin/power" "$HOME/.local/bin/power"
handle_file_ln "$HOME/.dotfiles/local/bin/scratchterm" "$HOME/.local/bin/scratchterm"
handle_file_ln "$HOME/.dotfiles/local/bin/snip" "$HOME/.local/bin/snip"
handle_file_ln "$HOME/.dotfiles/local/bin/sway-run" "$HOME/.local/bin/sway-run"
handle_file_ln "$HOME/.dotfiles/local/bin/update-hosts" "$HOME/.local/bin/update-hosts"
handle_file_ln "$HOME/.dotfiles/local/bin/update-nvim" "$HOME/.local/bin/update-nvim"
handle_file_ln "$HOME/.dotfiles/local/bin/update-wallpaper" "$HOME/.local/bin/update-wallpaper"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/010DD1D63E49D46C099F39E488B2A413" "$HOME/.mpv/watch_later/010DD1D63E49D46C099F39E488B2A413"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/0253F9F1B3660AC0E9A00967885832A1" "$HOME/.mpv/watch_later/0253F9F1B3660AC0E9A00967885832A1"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/028758CA73622F3FB3125759B2B68853" "$HOME/.mpv/watch_later/028758CA73622F3FB3125759B2B68853"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/05B15CFA04702C7F7D72969751B4A5F9" "$HOME/.mpv/watch_later/05B15CFA04702C7F7D72969751B4A5F9"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/0969A219F7D048CF324BE963BC0A3A7E" "$HOME/.mpv/watch_later/0969A219F7D048CF324BE963BC0A3A7E"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/0CFFFE0C8935A979FD94BE770E9A9FDB" "$HOME/.mpv/watch_later/0CFFFE0C8935A979FD94BE770E9A9FDB"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/11E79F52630BDE2C296D8F950BE99006" "$HOME/.mpv/watch_later/11E79F52630BDE2C296D8F950BE99006"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/1204E695227B8B3BEB271D5757121370" "$HOME/.mpv/watch_later/1204E695227B8B3BEB271D5757121370"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/12F559D7ECED59ACAB489718E8152ED2" "$HOME/.mpv/watch_later/12F559D7ECED59ACAB489718E8152ED2"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/12F8FCE18FCB7F7A9C5F0EFE240447CE" "$HOME/.mpv/watch_later/12F8FCE18FCB7F7A9C5F0EFE240447CE"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/132224F09096485CFBC661F33F97B0DD" "$HOME/.mpv/watch_later/132224F09096485CFBC661F33F97B0DD"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/14F6057DA686A10B3E52F69035E8A6C2" "$HOME/.mpv/watch_later/14F6057DA686A10B3E52F69035E8A6C2"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/1709DA4E21914B720EC7C2FEC7E7B7E6" "$HOME/.mpv/watch_later/1709DA4E21914B720EC7C2FEC7E7B7E6"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/191FC5542B9628BE4001443969FD0FAF" "$HOME/.mpv/watch_later/191FC5542B9628BE4001443969FD0FAF"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/1DB2FB505F7F0040C91D108B58AB420B" "$HOME/.mpv/watch_later/1DB2FB505F7F0040C91D108B58AB420B"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/25BA277C9360284E580718F27B1121AA" "$HOME/.mpv/watch_later/25BA277C9360284E580718F27B1121AA"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/25EB6E61845FAA6FE9E7E09C630155A4" "$HOME/.mpv/watch_later/25EB6E61845FAA6FE9E7E09C630155A4"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/26B1AB72CAEAB3DD78126A5F9E5961B8" "$HOME/.mpv/watch_later/26B1AB72CAEAB3DD78126A5F9E5961B8"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/2857275696AD7C22F619AB6F43FAA8CD" "$HOME/.mpv/watch_later/2857275696AD7C22F619AB6F43FAA8CD"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/29D5EA2C42E24F158727ADDE82B28CD8" "$HOME/.mpv/watch_later/29D5EA2C42E24F158727ADDE82B28CD8"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/2D4723ABCB6612A0CBB6BA09FC3A3BFA" "$HOME/.mpv/watch_later/2D4723ABCB6612A0CBB6BA09FC3A3BFA"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/2D6055E0BE621238281FFDEA85F5F74E" "$HOME/.mpv/watch_later/2D6055E0BE621238281FFDEA85F5F74E"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/305C410644F52E2FC2690CF5546403CB" "$HOME/.mpv/watch_later/305C410644F52E2FC2690CF5546403CB"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/385168A31AE759FF7F046726E1FD55C9" "$HOME/.mpv/watch_later/385168A31AE759FF7F046726E1FD55C9"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/390E50D0BAE7E273AC8B10029DFF387C" "$HOME/.mpv/watch_later/390E50D0BAE7E273AC8B10029DFF387C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/39E1CC6DC3C4631CA95750C708D4F8DD" "$HOME/.mpv/watch_later/39E1CC6DC3C4631CA95750C708D4F8DD"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/3C4D37A6BD302F4014427FA8FE9346E3" "$HOME/.mpv/watch_later/3C4D37A6BD302F4014427FA8FE9346E3"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/3CBB3ADDF0842FB5BC557D9826EDDD7A" "$HOME/.mpv/watch_later/3CBB3ADDF0842FB5BC557D9826EDDD7A"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/3CEE05C79F6173BA00519A85C5D0CD8B" "$HOME/.mpv/watch_later/3CEE05C79F6173BA00519A85C5D0CD8B"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/3D3AD2B4F73708FC8222CC2BC8500D36" "$HOME/.mpv/watch_later/3D3AD2B4F73708FC8222CC2BC8500D36"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/45941842C6F049617621E544E25098F9" "$HOME/.mpv/watch_later/45941842C6F049617621E544E25098F9"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/462392BF233AF0E1A56BDCA7CC9AAC94" "$HOME/.mpv/watch_later/462392BF233AF0E1A56BDCA7CC9AAC94"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/46D32B0D10BC25DEEE529EAE5ABEAA78" "$HOME/.mpv/watch_later/46D32B0D10BC25DEEE529EAE5ABEAA78"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/47BA28DBAD57EC678FF3A237114054BC" "$HOME/.mpv/watch_later/47BA28DBAD57EC678FF3A237114054BC"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/4AD4EE2A9A52D7BEEA8C4AB2EBEC5E2B" "$HOME/.mpv/watch_later/4AD4EE2A9A52D7BEEA8C4AB2EBEC5E2B"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/4C34322CE53894F81ED354BB200D3BE4" "$HOME/.mpv/watch_later/4C34322CE53894F81ED354BB200D3BE4"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/4CCD0BB03C814BF892EA7F65865599C9" "$HOME/.mpv/watch_later/4CCD0BB03C814BF892EA7F65865599C9"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/50E85079ADF8310BD1153604BD6A2DF3" "$HOME/.mpv/watch_later/50E85079ADF8310BD1153604BD6A2DF3"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/52A0229CA99283FD6A094C6445F8DE2E" "$HOME/.mpv/watch_later/52A0229CA99283FD6A094C6445F8DE2E"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/55A50AA2B01B086A4BE220C95A4F2DE6" "$HOME/.mpv/watch_later/55A50AA2B01B086A4BE220C95A4F2DE6"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/56210F6CA9766BCC7A778AEFFD8B9815" "$HOME/.mpv/watch_later/56210F6CA9766BCC7A778AEFFD8B9815"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/56A43D054B8B02467BAD5A9CD3A5DA92" "$HOME/.mpv/watch_later/56A43D054B8B02467BAD5A9CD3A5DA92"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/570CE9E34990226A2BE3A6FCC22D2431" "$HOME/.mpv/watch_later/570CE9E34990226A2BE3A6FCC22D2431"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/59F83DE6E3F926F262B313FDAD2F8F6F" "$HOME/.mpv/watch_later/59F83DE6E3F926F262B313FDAD2F8F6F"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/5B7863971E4E90135307A54B3523B10C" "$HOME/.mpv/watch_later/5B7863971E4E90135307A54B3523B10C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/5B9F69EA6AA416F2B97D0E3DABCE3612" "$HOME/.mpv/watch_later/5B9F69EA6AA416F2B97D0E3DABCE3612"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/5C5CC1221B4F9DB44C194C15AB67D8A8" "$HOME/.mpv/watch_later/5C5CC1221B4F9DB44C194C15AB67D8A8"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/64F4E6E5AE4C7C36FFA6E13A3DD3BD37" "$HOME/.mpv/watch_later/64F4E6E5AE4C7C36FFA6E13A3DD3BD37"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/663024997C32B8EC430220508BDA91E2" "$HOME/.mpv/watch_later/663024997C32B8EC430220508BDA91E2"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/6992C2805E50B47B79F93BE66420AB74" "$HOME/.mpv/watch_later/6992C2805E50B47B79F93BE66420AB74"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/6BBC7AF1067436FA6DA89456EC9F0F5E" "$HOME/.mpv/watch_later/6BBC7AF1067436FA6DA89456EC9F0F5E"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/6CA099F890E6464456D9250619FB9DF5" "$HOME/.mpv/watch_later/6CA099F890E6464456D9250619FB9DF5"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/6DB25DA0F8D92185DC04AF0D38CB6984" "$HOME/.mpv/watch_later/6DB25DA0F8D92185DC04AF0D38CB6984"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/72F5A7D967DBA0FB0C03AC4B96140275" "$HOME/.mpv/watch_later/72F5A7D967DBA0FB0C03AC4B96140275"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/809AE3B594D1617B6B5F17C041D14958" "$HOME/.mpv/watch_later/809AE3B594D1617B6B5F17C041D14958"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/8187B07CCB7B6AD2910BC2F37ED12358" "$HOME/.mpv/watch_later/8187B07CCB7B6AD2910BC2F37ED12358"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/83C4D928E3EB1C8D6C4FCC049D453FA8" "$HOME/.mpv/watch_later/83C4D928E3EB1C8D6C4FCC049D453FA8"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/8560455760798406C576CCC829C877C2" "$HOME/.mpv/watch_later/8560455760798406C576CCC829C877C2"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/874472932F07B013E54F3799094BC58C" "$HOME/.mpv/watch_later/874472932F07B013E54F3799094BC58C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/891393B9671B9228D68E0C3489D4AD3D" "$HOME/.mpv/watch_later/891393B9671B9228D68E0C3489D4AD3D"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/90446DE169CF436A6599DA23A681A2ED" "$HOME/.mpv/watch_later/90446DE169CF436A6599DA23A681A2ED"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/934E6ABA096B5B077492B3241A9BCA68" "$HOME/.mpv/watch_later/934E6ABA096B5B077492B3241A9BCA68"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/95F12AC6CC528CA7790F6A4A9D601C39" "$HOME/.mpv/watch_later/95F12AC6CC528CA7790F6A4A9D601C39"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/97A47626BBF05D28907C854952204C62" "$HOME/.mpv/watch_later/97A47626BBF05D28907C854952204C62"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/997A5367DC16622583B57CC42C5CD8BF" "$HOME/.mpv/watch_later/997A5367DC16622583B57CC42C5CD8BF"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/9A639B9DC5D5D4F74051E217318E2A60" "$HOME/.mpv/watch_later/9A639B9DC5D5D4F74051E217318E2A60"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/9AAC42638B7FFE3A3FFEE2C578B23A3C" "$HOME/.mpv/watch_later/9AAC42638B7FFE3A3FFEE2C578B23A3C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/9B2021203ED352BD635FEB0D46458944" "$HOME/.mpv/watch_later/9B2021203ED352BD635FEB0D46458944"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/9DA61ED4499BE92C61EBEE4840E996F7" "$HOME/.mpv/watch_later/9DA61ED4499BE92C61EBEE4840E996F7"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/9DB2AFF2D2E759ADC754BBDCA2474E0D" "$HOME/.mpv/watch_later/9DB2AFF2D2E759ADC754BBDCA2474E0D"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A05521A3F4F0240EC7347946314DFA0A" "$HOME/.mpv/watch_later/A05521A3F4F0240EC7347946314DFA0A"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A0A3952905AFA2CB8B9E4728FF9253DA" "$HOME/.mpv/watch_later/A0A3952905AFA2CB8B9E4728FF9253DA"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A158A77DC264407D6C9C48D0F7192256" "$HOME/.mpv/watch_later/A158A77DC264407D6C9C48D0F7192256"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A3EA5FB7A97F70291494EF00C61FB8CC" "$HOME/.mpv/watch_later/A3EA5FB7A97F70291494EF00C61FB8CC"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A578C0DB6216FAB025C47BA54F0CC913" "$HOME/.mpv/watch_later/A578C0DB6216FAB025C47BA54F0CC913"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A5AB1D9FCE4BC8A8CC9F097795FAB76D" "$HOME/.mpv/watch_later/A5AB1D9FCE4BC8A8CC9F097795FAB76D"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A800E98CB9CD2C11A2388B0C6826A448" "$HOME/.mpv/watch_later/A800E98CB9CD2C11A2388B0C6826A448"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A82290BE65432519BA63F08EE392D45A" "$HOME/.mpv/watch_later/A82290BE65432519BA63F08EE392D45A"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A8EE167D8CDEF92417F8409ADC022692" "$HOME/.mpv/watch_later/A8EE167D8CDEF92417F8409ADC022692"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A9100E1458D44C96A08DCADBCA950C1B" "$HOME/.mpv/watch_later/A9100E1458D44C96A08DCADBCA950C1B"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/A955F8D953827CCA588BE03F05796BDC" "$HOME/.mpv/watch_later/A955F8D953827CCA588BE03F05796BDC"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/AA71C0335B75E0110792A6754A094C14" "$HOME/.mpv/watch_later/AA71C0335B75E0110792A6754A094C14"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/ABE38D48F8FB4D98B6C8E4B1084950DF" "$HOME/.mpv/watch_later/ABE38D48F8FB4D98B6C8E4B1084950DF"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/AF79B111E8FC94B52B73AC1CA8676F68" "$HOME/.mpv/watch_later/AF79B111E8FC94B52B73AC1CA8676F68"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/B02779A5584B85813CC2A933A4A80CA9" "$HOME/.mpv/watch_later/B02779A5584B85813CC2A933A4A80CA9"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/B12885BA6BC8344AA61FE5AB6F4DF99F" "$HOME/.mpv/watch_later/B12885BA6BC8344AA61FE5AB6F4DF99F"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/B50B252B405A3095E74C6AFAA22D32C5" "$HOME/.mpv/watch_later/B50B252B405A3095E74C6AFAA22D32C5"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/B93267A0E62FE092577E28750107FB7D" "$HOME/.mpv/watch_later/B93267A0E62FE092577E28750107FB7D"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/B9A498F8EA102DEF710960CB79E4144F" "$HOME/.mpv/watch_later/B9A498F8EA102DEF710960CB79E4144F"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/BC92E35C88CFAAC213A6B5E4820FC4BB" "$HOME/.mpv/watch_later/BC92E35C88CFAAC213A6B5E4820FC4BB"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/BFBDBC4E790C16F3FB5DA0EEA370DD33" "$HOME/.mpv/watch_later/BFBDBC4E790C16F3FB5DA0EEA370DD33"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/C56943BA81D161AA40A6DA6443D5B928" "$HOME/.mpv/watch_later/C56943BA81D161AA40A6DA6443D5B928"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/C6FA7AE4EB9967530CC74207C4A8C58C" "$HOME/.mpv/watch_later/C6FA7AE4EB9967530CC74207C4A8C58C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/C719827DD1A048615B3AB1BACA305DB5" "$HOME/.mpv/watch_later/C719827DD1A048615B3AB1BACA305DB5"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/C7F23B9C7CCEBEADB6BB624A9BA00923" "$HOME/.mpv/watch_later/C7F23B9C7CCEBEADB6BB624A9BA00923"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/CAA789CFF12887818B4397ECE85E56CB" "$HOME/.mpv/watch_later/CAA789CFF12887818B4397ECE85E56CB"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/CC91BEC6019E630F4045029E34D0A40B" "$HOME/.mpv/watch_later/CC91BEC6019E630F4045029E34D0A40B"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/CE3F78388FF9056A176B1DAB442F6359" "$HOME/.mpv/watch_later/CE3F78388FF9056A176B1DAB442F6359"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/CFDD8AFFF5C89939D6F74C2BA0CEB895" "$HOME/.mpv/watch_later/CFDD8AFFF5C89939D6F74C2BA0CEB895"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/D97FEFCA083BD850985471A5BE5859E0" "$HOME/.mpv/watch_later/D97FEFCA083BD850985471A5BE5859E0"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/DBB2B59935D65DC44680F51D085D8F9C" "$HOME/.mpv/watch_later/DBB2B59935D65DC44680F51D085D8F9C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/DD5CB44F63EF16E4301E7FDBAB384B38" "$HOME/.mpv/watch_later/DD5CB44F63EF16E4301E7FDBAB384B38"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/DDB1BF02C8A0D82C479D8F8DB2BEF078" "$HOME/.mpv/watch_later/DDB1BF02C8A0D82C479D8F8DB2BEF078"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/DEC863634BAE6618E79E6977363F0162" "$HOME/.mpv/watch_later/DEC863634BAE6618E79E6977363F0162"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/E414BC955AC4C6E2147F52D3159441D2" "$HOME/.mpv/watch_later/E414BC955AC4C6E2147F52D3159441D2"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/E58BACE5031D9F30CDDD365D46D1DE9F" "$HOME/.mpv/watch_later/E58BACE5031D9F30CDDD365D46D1DE9F"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/E5D665E2EDE5F6C895B6B0FD7891E077" "$HOME/.mpv/watch_later/E5D665E2EDE5F6C895B6B0FD7891E077"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/E82500C5C9C363810DB3458C15849B71" "$HOME/.mpv/watch_later/E82500C5C9C363810DB3458C15849B71"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/EEFD7A503CA0336525F0B191C924ADEF" "$HOME/.mpv/watch_later/EEFD7A503CA0336525F0B191C924ADEF"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F0BF98FF0829D1CD860A4FF5B42BC182" "$HOME/.mpv/watch_later/F0BF98FF0829D1CD860A4FF5B42BC182"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F1E8E7FC6CB8C4D53F22DED824CA25D3" "$HOME/.mpv/watch_later/F1E8E7FC6CB8C4D53F22DED824CA25D3"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F2490C8DAB6638807D99899C0F31EB01" "$HOME/.mpv/watch_later/F2490C8DAB6638807D99899C0F31EB01"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F359886ADFF547675DD536EF699C037C" "$HOME/.mpv/watch_later/F359886ADFF547675DD536EF699C037C"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F5DBF12C3F731228A02B39B4B729A504" "$HOME/.mpv/watch_later/F5DBF12C3F731228A02B39B4B729A504"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F63A7FBC2BDA414FB810EC52F7EFEEAF" "$HOME/.mpv/watch_later/F63A7FBC2BDA414FB810EC52F7EFEEAF"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F8635C31EA7C35A790F853967A0C0CA5" "$HOME/.mpv/watch_later/F8635C31EA7C35A790F853967A0C0CA5"
handle_file_ln "$HOME/.dotfiles/mpv/watch_later/F99717A01173066CC54EB8F4938CEB84" "$HOME/.mpv/watch_later/F99717A01173066CC54EB8F4938CEB84"
handle_file_ln "$HOME/.dotfiles/profile" "$HOME/.profile"
handle_file_ln "$HOME/.dotfiles/pythonrc" "$HOME/.pythonrc"
handle_file_ln "$HOME/.dotfiles/rcrc" "$HOME/.rcrc"
handle_file_ln "$HOME/.dotfiles/ssh/config" "$HOME/.ssh/config"
handle_file_ln "$HOME/.dotfiles/tmux.conf" "$HOME/.tmux.conf"
handle_file_ln "$HOME/.dotfiles/tmux-keybindings.conf" "$HOME/.tmux-keybindings.conf"
handle_file_ln "$HOME/.dotfiles/vimrc" "$HOME/.vimrc"
