" vim:fdm=marker et fdl=2 ft=vim sts=2 sw=2 ts=2

let s:my_config_dir = expand('<sfile>:p:h')

for s:name in ['plugins', 'editing', 'interface', 'files', 'completion', 'git']
  execute 'source' fnameescape(s:my_config_dir.'/lib/'.s:name.'.vim')
endfor

for s:path in globpath(s:my_config_dir.'/lib/languages', '*', 0, 1)
  execute 'source' fnameescape(s:path)
endfor
