all: dist

install: dist
	@cd ruby && rake install

dist: extconf

gem: extconf
	@cd ruby && bundle install && rake compile

extconf: static-lib
	@cd ruby && bundle install
	@cd ruby/ext/rusty && ruby extconf.rb && make

static-lib: ruby/ext/rusty/librusty.a

ruby/ext/rusty/librusty.a: rust/target/librusty*.a
	@cp rust/target/librusty*.a ruby/ext/rusty/librusty.a

rust/target/librusty*.a:
	@cd rust && cargo build

clean:
	@cd rust && cargo clean
	@rm ruby/ext/rusty/librusty.a
