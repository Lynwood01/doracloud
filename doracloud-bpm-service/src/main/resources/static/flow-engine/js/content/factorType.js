var ftj = {
	getEditWin:function(operation) {
		var win = new Ext.ux.Window({
			title:operation + '因素类型',
			layout:'fit',
			width:300,
			height:150,
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
							name:'billTypeCode',
							readOnly:operation === '编辑',
							fieldLabel:'因素类型编码' + Q.color('*')
						}, {
							name:'billTypeName',
							fieldLabel:'因素类型名称' + Q.color('*')
						}]
				}],
			buttons:[{
					text:'保存',
					hidden:operation === '查看',
					handler:function() {
						var _win = this.ownerCt.ownerCt;
						var json = _win.find('name', 'form')[0].getForm().getValues();
						Ext.Ajax.request({
							url:path + '/ex/billType/save',
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
		title:'因素类型维护',
		region:'center',
		store:{
			url:path + '/ex/billType/getJson'
		},
		viewConfig:{
			forceFit:false
		},
		pageSize:0,
		cm:{
			columns:[{
					header:'因素类型编码',
					width:200,
					dataIndex:'billTypeCode'
				}, {
					header:'因素类型名称',
					width:300,
					dataIndex:'billTypeName'
				}]
		},
		tbar:[{
				text:'新建',
				build:false,
				iconCls:'icon-add',
				handler:function() {
					var win = ftj.getEditWin('新建');
					win.afterSave = function() {
						grid.getStore().reload();
					};
					win.show();
				}
			}, {
				text:'编辑',
				build:false,
				iconCls:'icon-edit',
				handler:function() {
					var recs = grid.getSelectionModel().getSelections();
					if (recs.length != 1) {
						Q.tips(Q.color('请选择一条记录编辑！'));
						return;
					}
					var win = ftj.getEditWin('编辑');
					win.find('name', 'form')[0].getForm().setValues(recs[0].data);
					win.afterSave = function() {
						grid.getStore().reload();
					};
					win.show();
				}
			}, {
				text:'查看',
				build:false,
				iconCls:'icon-view',
				handler:function() {
					var recs = grid.getSelectionModel().getSelections();
					if (recs.length != 1) {
						Q.tips(Q.color('请选择一条记录编辑！'));
						return;
					}
					var win = ftj.getEditWin('查看');
					win.find('name', 'form')[0].getForm().setValues(recs[0].data);
					win.show();
				}
			}, {
				text:'删除',
				build:false,
				iconCls:'icon-delete',
				handler:function() {
					var recs = grid.getSelectionModel().getSelections();
					var ids = [];
					for (var i = 0; i < recs.length; i++) {
						ids.push(recs[i].get('code'));
					}
					Ext.Ajax.request({
						url:path + '/ex/billType/remove',
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