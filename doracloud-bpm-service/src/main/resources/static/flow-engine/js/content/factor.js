var fj = {
	typeStore:new Ext.data.JsonStore({
		url:path + '/ex/billType/getJson',
		fields:['billTypeCode', 'billTypeName'],
		autoLoad:true
	}),
	dataTypeStore:new Ext.data.JsonStore({
		fields:['code'],
		data:[{
				code:'String'
			}, {
				code:'Boolean'
			}, {
				code:'Number'
			}, {
				code:'Date'
			}]
	}),
	getEditWin:function(operation) {
		var win = new Ext.ux.Window({
			title:operation + '因素类型',
			layout:'fit',
			width:300,
			height:220,
			items:[{
					name:'form',
					xtype:'form',
					border:false,
					labelWidth:90,
					bodyStyle:'padding:10px 0 0 10px',
					defaults:{
						xtype:'textfield',
						anchor:'95%'
					},
					items:[{
							name:'code',
							fieldLabel:'因素编码' + Q.color('*')
						}, {
							name:'name',
							fieldLabel:'因素名称' + Q.color('*')
						}, {
							xtype:'uxcombo',
							name:'factorType',
							fieldLabel:'因素类型编码',
							store:fj.typeStore,
							displayField:'billTypeCode',
							valueField:'billTypeCode',
							listeners:{
								select:function(_combo, r) {
									var form = this.ownerCt.getForm();
									form.findField('factorTypeName').setValue(r.get('billTypeName'));
								}
							}
						}, {
							name:'factorTypeName',
							readOnly:true,
							fieldLabel:'因素类型名称'
						}, {
							name:'dataType',
							xtype:'uxcombo',
							fieldLabel:'数据类型' + Q.color('*'),
							value:'Boolean',
							store:fj.dataTypeStore,
							displayField:'code',
							valueField:'code'
						}, {
							name:'operator',
							value:'EQ',
							hidden:true
						}, {
							name:'id',
							hidden:true
						}]
				}],
			buttons:[{
					text:'保存',
					hidden:operation === '查看',
					handler:function() {
						var _win = this.ownerCt.ownerCt;
						var json = _win.find('name', 'form')[0].getForm().getValues();
						Ext.Ajax.request({
							url:path + '/ex/factor/save',
							params:{
								jsonStr:Ext.encode(json)
							},
							success:function(response) {
								if (Ext.decode(response.responseText).success) {
									_win.destroy();
									if (_win.afterSave) {
										_win.afterSave();
									}
									Q.tips('保存成功！');
								} else {
									Q.tips('保存失败！');
								}
							},
							failure:function(action, from) {
								Q.tips(Q.color('保存失败！'));
							}
						});
					}
				}, {
					text:'关闭',
					handler:function() {
						this.ownerCt.ownerCt.destroy();
					}
				}]
		});

		return win;
	}
};

Ext.onReady(function() {
	Ext.BLANK_IMAGE_URL = "${contextPath}/../plugins/ext3/resources/images/default/s.gif";
	var grid = null;
	grid = new Ext.ux.grid.GridPanel({
		region:'center',
		viewConfig:{
			forceFit:false
		},
		store:{
			url:path + '/ex/factor/getJson'
		},
		pageSize:0,
		cm:{
			defaults:{
				width:150
			},
			columns:[{
					disabled:true,
					dataIndex:'id'
				}, {
					header:'因素编码',
					dataIndex:'code'
				}, {
					header:'因素名称',
					dataIndex:'name'
				}, {
					header:'因素类型编码',
					dataIndex:'factorType'
				}, {
					header:'因素类型名称',
					dataIndex:'factorTypeName'
				}, {
					header:'数据类型',
					dataIndex:'dataType'
				}]
		},
		tbar:[{
				text:'新建',
				iconCls:'icon-add',
				handler:function() {
					var win = fj.getEditWin('新建');
					win.afterSave = function() {
						grid.getStore().reload();
					};
					win.show();
				}
			}, {
				text:'编辑',
				iconCls:'icon-edit',
				handler:function() {
					var recs = grid.getSelectionModel().getSelections();
					if (recs.length != 1) {
						Q.tips(Q.color('请选择一条记录编辑！'));
						return;
					}
					var win = fj.getEditWin('编辑');
					win.find('name', 'form')[0].getForm().setValues(recs[0].data);
					win.afterSave = function() {
						grid.getStore().reload();
					};
					win.show();
				}
			}, {
				text:'查看',
				iconCls:'icon-view',
				handler:function() {
					var recs = grid.getSelectionModel().getSelections();
					if (recs.length != 1) {
						Q.tips(Q.color('请选择一条记录编辑！'));
						return;
					}
					var win = fj.getEditWin('查看');
					win.find('name', 'form')[0].getForm().setValues(recs[0].data);
					win.show();
				}
			}, {
				text:'删除',
				iconCls:'icon-delete',
				handler:function() {
					var recs = grid.getSelectionModel().getSelections();
					var ids = [];
					for (var i = 0; i < recs.length; i++) {
						ids.push(recs[i].get('id'));
					}
					Ext.Ajax.request({
						url:path + '/ex/factor/remove',
						params:{
							jsonStr:Ext.encode(ids)
						},
						success:function(response) {
							if (Ext.decode(response.responseText).success) {
								grid.getStore().reload();
								Q.tips('删除成功！');
							} else {
								Q.tips('删除失败！');
							}
						},
						failure:function(action, from) {
							Q.tips(Q.color('删除失败！'));
						}
					});
				}
			}]
	});
	new Ext.Viewport({
		layout:'border',
		items:[grid]
	});
});