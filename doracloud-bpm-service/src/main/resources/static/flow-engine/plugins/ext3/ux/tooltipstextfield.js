/**
 * 添加带提示的文本框。xtype:"tooltipstextfield"
 * 2014-02-17
 * 使用方法
{
    name : 'name',
    xtype : 'tooltipstextfield',
    fieldLabel : '姓名',
    labelSeparator : ':',
    tooltip:{text:'多个用\",\"分隔, 将组成OR关系',title:'提示'},
    anchor : '95%'
}
 * @class TootipsTextfield
 * @extends Ext.form.TextField
 */

TootipsTextfield = Ext.extend(Ext.form.TextField,{   
        tooltip:{},   
        onRender:function(ct, position){   
            TootipsTextfield.superclass.onRender.call(this, ct, position);   
            if(this.tooltip.text){   
                new Ext.ToolTip({
                    target:this.id,
                    trackMouse:false,
                    draggable:true,
                    maxWidth:200,
                    minWidth:100,
                    title:"<span style='color:blue'>" + this.tooltip.title + "</span>",
                    html:"<span style='color:blue'>" + this.tooltip.text + "</span>"
                }); 
            }  
        }   
    });   
Ext.reg('tooltipstextfield',TootipsTextfield);  