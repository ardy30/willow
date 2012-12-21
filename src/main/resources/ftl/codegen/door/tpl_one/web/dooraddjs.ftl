/**
*版权声明：${codeGenConfig.developerConfig.company!} 版权所有 违者必究
*日    期： ${date!}
*作    者： ${codeGenConfig.developerConfig.developer!}
*/
$(document).ready(function () {
    function save${codeGenConfig.table.classVar!}() {
        var obj = $("#${codeGenConfig.table.classVariable!}Form").serializeJson();
        $.localAjax({
            url:"/admin/${codeGenConfig.table.simplePackageVar!}/save",
            data:obj,
            dataType:"json",
            type:"POST",
            success:function (result) {
                if (result.success == "1") {
                    $.success("增加成功！", true, 3000);
                    top.jq.workgroundManager.returnPage(true);
                } else {
                    alert(result.msg);
                }
            }
        })
    }
    var config={
    reportMode:"alert",
    formDiv:"${codeGenConfig.table.classVariable!}Form",
    props:[
    <#list tableClass.fieldColumns as fieldColumn>
        <#if  !fieldColumn.isIncludeField>
        {
            name:"${fieldColumn.javaProperty!}",
            label:"${fieldColumn.propName!}",
            trim:true,
            required:<#if fieldColumn.required>true</#if><#if !fieldColumn.required>false</#if>
            <#if  fieldColumn.jdbcType="Integer">
            ,dataType:"int"
            </#if>
        }<#if fieldColumn_has_next>,</#if>
        </#if>
    </#list>
    ]
    }
    var checkValid = $.checkValid(config);//构建验证对象
    $("#save${codeGenConfig.table.classVar!}").click(function () {
        if(checkValid.checkAll()){
            save${codeGenConfig.table.classVar!}();
        }
    });

    $("#_back").click(function () {
        top.jq.workgroundManager.returnPage(true);
    });

})