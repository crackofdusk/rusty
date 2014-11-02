# https://github.com/ruby/ruby/blob/19121b47392732c5083e36478a24d7883efab299/README.EXT#L786

require 'mkmf'

have_library('rusty')

create_makefile('rusty/rusty')
