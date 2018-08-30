/*
 * Compressed by JSA(www.xidea.org)
 */
Ext.ns ("Ext.ux.Msg","Ext.ux.tree.TreePanel");
Ext.ux.Msg.title = {
    info: "information",
    confirm: "confirm",
    warning: "Warning", 
    error: "error",
    tips:"Tips"
};
Ext.apply (Ext.ux.tree.TreePanel.prototype, {
    rootText:" root node "
}) 
Ext.apply (Ext.Element.prototype, {
    loadText:"loading data, please wait ... ", 
    submitText:" submit data, please wait ... "
});
if(Ext.form.VTypes)Ext.apply(Ext.form.VTypes,{
    idcardText:"identity card number is not correct ",
    zipcodeText:"ZIP code incorrect ",
    telText:"the phone number is not correct",
    mobileText:"the phone number is not correct",
    ipText:"IP address is not correct",
    keyText:"encoding format is incorrectcoding only: letters, numbers, underscores, minus and minus sign can not be used as encoding the beginning",
    chineseText:"Only allow input Chinese characters and the whole Angle"
})