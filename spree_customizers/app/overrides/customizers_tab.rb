Deface::Override.new(
	:name => "customizers_tab",
	:virtual_path => "spree/layouts/admin",
	:insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
	:text => '<%= tab :customizers %>'
)