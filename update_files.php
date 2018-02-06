<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$dataInfo=$_GET;
echo "正在更新文件...<br>";
exec("cd /opt/web/shiseido-cpb-code;git pull http://".$dataInfo['name'].":".$dataInfo['password']."@gitlab.3tichina.com/grp-project/shiseido-cpb-code.git 2>&1",$out);
header("Content-type: text/html; charset=utf-8"); 
var_export($out);
echo "<br>更新文件成功！";