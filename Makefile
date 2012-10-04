TWITTER = ./twitter-bootstrap
BOOTSTRAP_LESS = ${TWITTER}/less/bootstrap.less
BOOTSTRAP_RESPONSIVE = ${TWITTER}/docs/assets/css/bootstrap-responsive.css
BOOTSTRAP_RESPONSIVE_LESS = ${TWITTER}/less/responsive.less


#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# recess & uglifyjs are required
#

bootstrap:
	mkdir -p bootstrap/img
	mkdir -p bootstrap/css
	mkdir -p bootstrap/js
	cp ${TWITTER}/img/* bootstrap/img/
	recess --compile ${BOOTSTRAP_LESS} > bootstrap/css/bootstrap.css
	recess --compress ${BOOTSTRAP_LESS} > bootstrap/css/bootstrap.min.css
	recess --compile ${BOOTSTRAP_RESPONSIVE_LESS} > bootstrap/css/bootstrap-responsive.css
	recess --compress ${BOOTSTRAP_RESPONSIVE_LESS} > bootstrap/css/bootstrap-responsive.min.css
	cat ${TWITTER}/js/bootstrap-transition.js ${TWITTER}/js/bootstrap-alert.js ${TWITTER}/js/bootstrap-button.js ${TWITTER}/js/bootstrap-carousel.js ${TWITTER}/js/bootstrap-collapse.js ${TWITTER}/js/bootstrap-dropdown.js ${TWITTER}/js/bootstrap-modal.js ${TWITTER}/js/bootstrap-tooltip.js ${TWITTER}/js/bootstrap-popover.js ${TWITTER}/js/bootstrap-scrollspy.js ${TWITTER}/js/bootstrap-tab.js ${TWITTER}/js/bootstrap-typeahead.js ${TWITTER}/js/bootstrap-affix.js > bootstrap/js/bootstrap.js
	uglifyjs -nc bootstrap/js/bootstrap.js > bootstrap/js/bootstrap.min.tmp.js
	echo "/*!\n* Bootstrap.js by @fat & @mdo\n* Copyright 2012 Twitter, Inc.\n* http://www.apache.org/licenses/LICENSE-2.0.txt\n*/" > bootstrap/js/copyright.js
	cat bootstrap/js/copyright.js bootstrap/js/bootstrap.min.tmp.js > bootstrap/js/bootstrap.min.js
	rm bootstrap/js/copyright.js bootstrap/js/bootstrap.min.tmp.js


#
# CLEANS THE ROOT DIRECTORY OF PRIOR BUILDS
#

clean:
	rm -r bootstrap

