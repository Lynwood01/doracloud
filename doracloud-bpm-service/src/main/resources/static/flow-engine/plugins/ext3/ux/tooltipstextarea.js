/**
 * 添加带提示的文本框。xtype:"tooltipstextarea"
 * 2014-02-17
 * 使用方法
{
    name : 'name',
    xtype : 'tooltipstextarea',
    fieldLabel : '姓名',
    labelSeparator : ':',
    tooltip:{text:'多个用\",\"分隔, 将组成OR关系',title:'提示'},
    anchor : '95%'
}
 * @class TootipsTextarea
 * @extends Ext.form.TextArea
 */

TootipsTextarea = Ext.extend(Ext.form.TextArea,{   
        tooltip:{},   
        onRender:function(ct, position){   
            TootipsTextarea.superclass.onRender.call(this, ct, position);   
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
Ext.reg('tooltipstextarea',TootipsTextarea);  