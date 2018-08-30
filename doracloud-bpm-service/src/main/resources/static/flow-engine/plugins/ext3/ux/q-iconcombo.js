// Create创建用户的扩展（User eXtensions namespace (Q)）
Ext.namespace('Q');
 
/**
  * Q.IconCombo 扩展类
  *
  * @author Jozef Sakalos, aka Saki
  * @version 1.0
  *
  * @class Q.IconCombo
  * @extends Ext.form.ComboBox
  * @constructor
  * @param {Object} config 配置项参数
  */
Q.IconCombo = function(config) {
 
    // 调用父类的构建函数
    Q.IconCombo.superclass.constructor.call(this, config);
 	
} // Q.IconCombo构建器的底部
 
/**
  * Q.IconCombo Extension Class
  *
  * @author  Jozef Sakalos
  * @version 1.0
  *
  * @class Q.IconCombo
  * @extends Ext.form.ComboBox
  * @constructor
  * @param {Object} config Configuration options
  * config属性说明：iconClsField 图标css，其他属性和combox一样
  *  xtype: iconcombo
  */
// extend
Ext.extend(Q.IconCombo, Ext.form.ComboBox, {
	
	initComponent:function(){
		Ext.apply(this, {
            tpl:  '<tpl for=".">'
                + '<div class="x-combo-list-item ux-icon-combo-item '
                + '{' + this.iconClsField + '}">'
                + '{' + this.displayField + '}'
                + '</div></tpl>'
		});
		
		Q.IconCombo.superclass.initComponent.call(this);
	},
	onRender:function(ct, position) {
        // 回调父组件onrender
        Q.IconCombo.superclass.onRender.apply(this, arguments);

        // adjust styles
        this.wrap.applyStyles({position:'relative'});
        this.el.addClass('ux-icon-combo-input');

        // 给icon加div
        this.icon = Ext.DomHelper.append(this.el.up('div.x-form-field-wrap'), {
            tag: 'div', style:'position:absolute'
        });
    }, // onRender函数
    afterRender:function() {
        Q.IconCombo.superclass.afterRender.apply(this, arguments);
        if(undefined !== this.value) {
            this.setValue(this.value);
        }
    }, // afterRender函数
    setIconCls:function() {
        var rec = this.store.query(this.valueField, this.getValue()).itemAt(0);
        if(rec && this.icon) {
            this.icon.className = 'ux-icon-combo-icon ' + rec.get(this.iconClsField);
        }
    },//函数样式
    setValue: function(value) {
        Q.IconCombo.superclass.setValue.call(this, value);
        this.setIconCls();
    }
 
}); // end of extend
 // 注册xtype
Ext.reg('iconcombo', Q.IconCombo);