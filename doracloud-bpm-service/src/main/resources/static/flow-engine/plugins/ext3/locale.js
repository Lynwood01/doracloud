/**
 * 
 */
Ext.namespace("Ext.ux.data");

Ext.ux.data.Locale = function(M) {
	this.map = M || {};
};
Ext.extend(Ext.ux.data.Locale, Ext.util.Observable, {
	get : function(key) {
		var value = this.map[key] || (key + ' not found!');
		if (arguments.length > 1 && value.indexOf('{') >= 0) {
			value = new Ext.Template(value).apply(Array.prototype.slice.call(arguments, 1));
		}
		return value;
	}
});

// ajaxLocale is a JSON object downloaded from the server side
var locale = new Ext.ux.data.Locale(ajaxLocale);

// shortcut for the method locale.get
$ = locale.get.createDelegate(locale);